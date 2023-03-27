//
//  PokemonData.swift
//  Pokemon
//
//  Created by Nicolas Demange on 24/03/2023.
//

import Foundation

struct PokemonData: Decodable {
    let name: String
    let image: String
    let stats: Stats
}

struct Stats: Codable {
    let hp, attack, defense, specialAttack: Int
    let specialDefense, speed: Int

    enum CodingKeys: String, CodingKey {
        case hp = "HP"
        case attack, defense
        case specialAttack = "special_attack"
        case specialDefense = "special_defense"
        case speed
    }
}

