//
//  PokedexView.swift
//  PokemonSwiftUI
//
//  Created by Gerry Sheil on 09/05/2024.
//


import SwiftUI

struct PokedexView: View{
    
    @StateObject private var vm = PokemonViewModel()
    
    let pokedexEntry: PokedexEntry
    
    var body: some View{
        HStack(alignment: .top){
            
            NavigationLink(destination: {
                PokemonView(pokemonURL: pokedexEntry.url )
            }, label: {
                Text("\(pokedexEntry.name.capitalized)")
            })
        }
        .frame(maxWidth: .infinity,
               alignment: .center)
        .padding()
        .background(Color.gray.opacity(0.1), 
                    in: RoundedRectangle(cornerRadius: 10,
                                         style: .continuous))
        .padding(.horizontal, 4)
    }
}


struct PokedexView_Previews: PreviewProvider{
    static var previews: some View{
        PokedexView(pokedexEntry: .init(name: "Bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/"))
    }
}
