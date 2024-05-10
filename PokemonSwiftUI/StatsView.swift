//
//  StatsView.swift
//  PokemonSwiftUI
//
//  Created by Gerry Sheil on 10/05/2024.
//

import SwiftUI

struct StatsView: View {
    var pokemonStats: [Stats] = []
    
    var body: some View {
        VStack{
            HStack{
                Text(pokemonStats[0].stat.name.uppercased()).bold()
                Spacer().frame(width: 50)
                Text("\(pokemonStats[0].baseStat)")
                Spacer()
            }
            HStack{
                Text("ATT").bold()
                Spacer().frame(width: 42)
                Text("\(pokemonStats[1].baseStat)")
                Spacer()
            }
            HStack{
                Text("DEF").bold()
                Spacer().frame(width: 42)
                Text("\(pokemonStats[2].baseStat)")
                Spacer()
            }
            HStack{
                Text("SP.ATT").bold()
                Spacer().frame(width: 18)
                Text("\(pokemonStats[3].baseStat)")
                Spacer()
            }
            HStack{
                Text("SP.DEF").bold()
                Spacer().frame(width: 18)
                Text("\(pokemonStats[4].baseStat)")
                Spacer()
                
            }
            HStack{
                Text("SPD").bold()
                Spacer().frame(width: 42)
                Text("\(pokemonStats[5].baseStat)")
                Spacer()
            }
        }
    }
}

#Preview {
    StatsView(pokemonStats: [Stats(baseStat: 10, stat: Stat(name: "hp")), Stats(baseStat: 15, stat: Stat(name: "attack")), Stats(baseStat: 15, stat: Stat(name: "defence")), Stats(baseStat: 15, stat: Stat(name: "special-attack")), Stats(baseStat: 15, stat: Stat(name: "special-defence")), Stats(baseStat: 15, stat: Stat(name: "speed"))])
}
