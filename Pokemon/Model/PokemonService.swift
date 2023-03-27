//
//  PokemonService.swift
//  Pokemon
//
//  Created by Nicolas Demange on 27/03/2023.
//

import Foundation

func getPokemon(name: String, callback: @escaping (Result<PokemonData, Error>) -> Void) {
    guard let urlAPI = URL(string: "https://pokebuildapi.fr/api/v1/pokemon/\(name)") else { return }
    
    let session = URLSession(configuration: .default)
    
    let task = session.dataTask(with: urlAPI) { data, response, error in
        if error != nil {
            callback(.failure(error!))
            return
        }
        
        if let safeData = data {
            parseJSON(pokemonData: safeData, callback: callback)
        }
    }
    task.resume()
}

func parseJSON(pokemonData: Data, callback: @escaping (Result<PokemonData, Error>) -> Void) {
    DispatchQueue.main.async {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(PokemonData.self, from: pokemonData)
            callback(.success(decodedData))
        } catch {
            callback(.failure(error))
        }
    }
}
