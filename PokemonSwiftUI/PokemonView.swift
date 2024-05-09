//
//  PokemonView.swift
//  PokemonSwiftUI
//
//  Created by Gerry Sheil on 09/05/2024.
//

import SwiftUI

struct PokemonView: View{
    var pokemonURL: String
    
    @StateObject private var vm = PokemonViewModel()
    
    
    var body: some View {
            ZStack {
                List{
                    Text("**Name**: \(vm.pokemon.name)")
                    Text("**DexNo**: \(vm.pokemon.id)")
                    if !vm.pokemon.types.isEmpty && vm.pokemon.types.count == 2{
                        Text( "**Types**: \(vm.pokemon.types[0].type.name) \(vm.pokemon.types[1].type.name)")
                    }else if !vm.pokemon.types.isEmpty{
                        Text( "**Type**: \(vm.pokemon.types[0].type.name)")
                    }
                    if !vm.pokemon.stats.isEmpty{
                        Text("**Stats**: \(vm.pokemon.stats[0].baseStat)")
                    }
                    Text("\(vm.pokemon.sprites.frontDefault)")
                }
                .listStyle(.plain)
            .navigationTitle("Pokedex")
            }
            .onAppear{
                vm.fetchPokemon(pokemonUrl: pokemonURL)
            }
        }
}


struct PokemonView_Previews: PreviewProvider{
    static var previews: some View{
        PokemonView(pokemonURL: "https://pokeapi.co/api/v2/pokemon/1/")
    }
}
