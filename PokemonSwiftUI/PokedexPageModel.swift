//
//  PokedexPageModel.swift
//  PokemonSwiftUI
//
//  Created by Gerry Sheil on 09/05/2024.
//

import Foundation

struct PokedexPage: Codable{
    let next: String?
    let previous: String?
    let results: [PokedexEntry]
}

struct PokedexEntry: Codable{
    let name: String
    let url: String
}
