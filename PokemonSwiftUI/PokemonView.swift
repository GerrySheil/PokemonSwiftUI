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
                HStack {
                    Spacer()
                    AsyncImage(url: URL(string: vm.pokemon.sprites.frontDefault)){image in
                        image.resizable()
                    }placeholder: {
                        ProgressView()
                    }
                    .frame(width: 200, height: 200, alignment: .center)
                    Spacer()
                }
                Text("**Name**: \(vm.pokemon.name.capitalized)")
                Text("**DexNo**: \(vm.pokemon.id)")
                if !vm.pokemon.types.isEmpty && vm.pokemon.types.count == 2{
                    Text( "**Types**: \(vm.pokemon.types[0].type.name.capitalized) \(vm.pokemon.types[1].type.name.capitalized)")
                }else if !vm.pokemon.types.isEmpty{
                    Text( "**Type**: \(vm.pokemon.types[0].type.name.capitalized)")
                }
                if !vm.pokemon.stats.isEmpty{
                    StatsView(pokemonStats: vm.pokemon.stats)
                }
            }
            .listStyle(.automatic)
            .navigationTitle("Pokedex")
            .alert(isPresented: $vm.hasError, error: vm.error){
                Button(action: {
                    vm.fetchPokemon(pokemonUrl: pokemonURL)
                }, label: {
                    Text("Retry")
                })
            }.frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .onAppear{
                    vm.fetchPokemon(pokemonUrl: pokemonURL)
                }
        }
    }
}
    
    struct PokemonView_Previews: PreviewProvider{
        static var previews: some View{
            PokemonView(pokemonURL: "https://pokeapi.co/api/v2/pokemon/1/")
        }
    }

