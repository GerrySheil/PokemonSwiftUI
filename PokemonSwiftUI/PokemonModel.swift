//
//  PokemonModel.swift
//  PokemonSwiftUI
//
//  Created by Gerry Sheil on 09/05/2024.
//

import Foundation

struct Pokemon: Codable {
    let id: Int
    let name: String
    let sprites: Sprites
    let types: [Types]
    let stats: [Stats]
}

struct Sprites: Codable{
    let frontDefault: String
}

struct Types: Codable{
    let type: Type
}

struct Type: Codable{
    let name: String
}

struct Stats: Codable{
    let baseStat: Int
    let stat: Stat
}

struct Stat: Codable{
    let name: String
}


