//
//  PokedexPageViewModel.swift
//  PokemonSwiftUI
//
//  Created by Gerry Sheil on 09/05/2024.
//

import Foundation

final class PokedexPageViewModel: ObservableObject{
    
    @Published var pokedexEntries: [PokedexEntry] = []
    @Published var hasError = false
    @Published var error: UserError?
    @Published private(set) var isRefreshing = false
    
    var offset: Int = 20
    
    
    init(){
        fetchPokedexPage()
    }
    
    func loadMorePokemon(i: Int){
        if i + 1 >= offset{
            fetchPokedexPage(pokedexPageURL: "https://pokeapi.co/api/v2/pokemon?offset=\(offset)")
            offset += 20
        }
        
    }
    
    func fetchPokedexPage(pokedexPageURL: String = "https://pokeapi.co/api/v2/pokemon"){
        
        isRefreshing = true
        hasError = false
        
        if let url = URL(string: pokedexPageURL){
            
           
            
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
                               let pokedexPage = try? decoder.decode(PokedexPage.self, from: data){
                                self?.pokedexEntries.append(contentsOf: pokedexPage.results)
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

extension PokedexPageViewModel{
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
