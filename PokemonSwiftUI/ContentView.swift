//
//  ContentView.swift
//  PokemonSwiftUI
//
//  Created by Gerry Sheil on 09/05/2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm = PokedexPageViewModel()
    
    
    
    @State private var i: Int = 0
    
    var body: some View {
        
        NavigationView{
            
            ZStack {
                VStack {
                    List{
                            
                            ForEach(vm.pokedexEntries, id: \.name){ pokedexEntry in
                                PokedexView(pokedexEntry: pokedexEntry)
                                    .listRowSeparator(.hidden).onAppear(){
                                        vm.loadMorePokemon(i: i)
                                        i += 1
                                    }
                                
                            }
                        }
                        .listStyle(.plain)
                        .navigationTitle("Pokedex")
                        .alert(isPresented: $vm.hasError, error: vm.error){
                            Button(action: {
                                vm.fetchPokedexPage()
                            }, label: {
                                Text("Retry")
                            })
                    }
                    if vm.isRefreshing{
                        ProgressView()
                    }
                }
                
                }
        }
    }
}

struct ContentView_Preview: PreviewProvider{
    static var previews: some View{
        ContentView()
    }
}
