//
//  PokemonEntity.swift
//  PokequedexVIPER
//
//  Created by Macbook Air on 30/01/24.
//

import Foundation

struct PokemonEntity: Decodable {
    let name: String
    let id: Int
    init(name: String, id: Int) {
        self.name = name
        self.id = id
    }
}

