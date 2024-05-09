//
//  PokemonViewModel.swift
//  PokemonSwiftUI
//
//  Created by Gerry Sheil on 09/05/2024.
//

import Foundation

final class PokemonViewModel: ObservableObject{
    
    @Published var pokemon: Pokemon = Pokemon(id: 0, name: "", sprites: Sprites(frontDefault: ""), types: [], stats: [])
    
    func fetchPokemon(pokemonUrl: String){
        
        if let url = URL(string: pokemonUrl){
            
            URLSession
                .shared
                .dataTask(with: url){ [weak self] data, response, error in
                    
                    if let error = error{
                        print(error.localizedDescription)
                        
                    }else{
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        
                        if let data = data,
                           let pokemon = try? decoder.decode(Pokemon.self, from: data){
                            
                            self?.pokemon = pokemon
                            
                        }else{
                            
                        }
                    }
                }.resume()
        }
        
        
    }
}
