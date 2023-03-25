//
//  SearchController.swift
//  Pokemon
//
//  Created by Nicolas Demange on 24/03/2023.
//

import UIKit

class SearchController: UIViewController {
    
    // MARK: - Properties
    // IBOutlets
    
    @IBOutlet weak var pokemonNameTextField: UITextField!
    
    @IBOutlet weak var namePokemonLabel: UILabel!
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var hpLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var specialAttackLabel: UILabel!
    @IBOutlet weak var specialDefenseLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        getPokemon(name: pokemonNameTextField.text ?? "")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Methods
    
    func getPokemon(name: String) {
        
        guard let urlAPI = URL(string: "https://pokebuildapi.fr/api/v1/pokemon/\(name)") else { return }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: urlAPI) { data, response, error in
            if error != nil {
                print(error!)
                return
            }
            
            if let safeData = data {
                self.parseJSON(pokemonData: safeData)
            }
        }
        task.resume()
    }
    
    func parseJSON(pokemonData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(PokemonData.self, from: pokemonData)
            self.namePokemonLabel.text = decodedData.name
        } catch {
            print(error)
        }
    }
    
}

