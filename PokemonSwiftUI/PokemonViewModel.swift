//
//  PokemonViewModel.swift
//  PokemonSwiftUI
//
//  Created by Gerry Sheil on 09/05/2024.
//

import Foundation

final class PokemonViewModel: ObservableObject{
    
    @Published var pokemon: Pokemon = Pokemon(id: 0, name: "", sprites: Sprites(frontDefault: ""), types: [], stats: [])
    @Published var hasError = false
    @Published var error: UserError?
    @Published private(set) var isRefreshing = false
    
    func fetchPokemon(pokemonUrl: String){
        
        isRefreshing = true
        hasError = false
        
        if let url = URL(string: pokemonUrl){
            
           
            
            URLSession
                .shared
                .dataTask(with: url){ [weak self] data, response, error in
                    
                    DispatchQueue.main.async {
                        if let error = error{
                            self?.hasError = true
                            self?.error = UserError.custom(error: error)
                            
                        }else{
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .convertFromSnakeCase
                            if let data = data,
                               let pokemon = try? decoder.decode(Pokemon.self, from: data){
                                self?.pokemon = pokemon
                            }else{
                                self?.hasError = true
                                self?.error = UserError.failedtoDecode
                            }
                        }
                        self?.isRefreshing = false
                    }
                }.resume()
        }
        
        
    }

}

extension PokemonViewModel{
    enum UserError: LocalizedError{
        case custom(error: Error)
        case failedtoDecode
        
        var errorDescription: String?{
            switch self{
            case .failedtoDecode:
                return "Failed to decode response"
            case .custom(let error):
                return error.localizedDescription
            }
        }
    }
}
