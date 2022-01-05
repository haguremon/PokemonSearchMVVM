//
//  PokemonResponse.swift
//  PokemonSearchMVVM
//
//  Created by IwasakIYuta on 2022/1/5.
//

import Foundation

struct PokemonResponse: Decodable {
    
    let name: String
    let order: Int
    let sprites: Sprites
    let types: [Types]
}

struct Sprites: Decodable {
    
    let frontDefault: String
    
    enum CodingKeys : String, CodingKey {
        case frontDefault = "front_default"
    
    }
    
}
struct Types: Decodable {
        
    let type: Type

}

struct Type: Decodable {
    
    let name: String
}
