//
//  PokedexPageViewModel.swift
//  PokemonSwiftUI
//
//  Created by Gerry Sheil on 09/05/2024.
//

import Foundation

final class PokedexPageViewModel: ObservableObject{
    
    @Published var pokedexEntries: [PokedexEntry] = []
    
    func fetchPokedexPage(pokedexPageURL: String = "https://pokeapi.co/api/v2/pokemon"){
        
        if let url = URL(string: pokedexPageURL){
            
            URLSession
                .shared
                .dataTask(with: url){ [weak self] data, response, error in
                    
                    if let error = error{
                        
                    }else{
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        
                        if let data = data,
                           let pokedexPage = try? decoder.decode(PokedexPage.self, from: data){
                            
                            self?.pokedexEntries = pokedexPage.results
                        }else{
                            
                        }
                    }
                }.resume()
        }
     
    }
}
