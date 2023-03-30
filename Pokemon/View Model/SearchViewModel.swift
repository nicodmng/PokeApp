//
//  SearchViewModel.swift
//  Pokemon
//
//  Created by Nicolas Demange on 27/03/2023.
//

import Foundation

final class SearchViewModel {
    // MARK: - Properties
    
    let service = PokemonService()
    var pokemon: ((Pokemon) -> Void)?
    
    // MARK: - Methods
    
    func load(name: String) {
        service.getPokemon(name: name) { result in
            switch result {
            case let .success(data):
                let pokemon = Pokemon(
                    name: data.name,
                    image: data.image,
                    hp: String(data.stats.hp),
                    attack: String(data.stats.attack),
                    defense: String(data.stats.defense),
                    specialAttack: String(data.stats.specialAttack),
                    specialDefense: String(data.stats.specialDefense),
                    speed: String(data.stats.speed))
                self.pokemon?(pokemon)
            case let .failure(error):
                print("\(error)")
            }
        }
    }
    
}

// MARK: - Structures

struct Pokemon {
    let name: String
    let image: String
    let hp: String
    let attack: String
    let defense: String
    let specialAttack: String
    let specialDefense: String
    let speed: String
}
