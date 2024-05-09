//
//  ContentView.swift
//  PokemonSwiftUI
//
//  Created by Gerry Sheil on 09/05/2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm = PokedexPageViewModel()
    
    
    
    var body: some View {
        NavigationView{
            ZStack {
                List{
                   
                    ForEach(vm.pokedexEntries, id: \.name){ pokedexEntry in
                        PokedexView(pokedexEntry: pokedexEntry)
                            .listRowSeparator(.hidden)
                        
                    }
                }
                .listStyle(.plain)
            .navigationTitle("Pokedex")
            }
            .onAppear{
                vm.fetchPokedexPage()
            }
        }
    }
}

struct ContentView_Preview: PreviewProvider{
    static var previews: some View{
        ContentView()
    }
}
