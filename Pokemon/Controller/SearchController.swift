//
//  SearchController.swift
//  Pokemon
//
//  Created by Nicolas Demange on 24/03/2023.
//

import UIKit

class SearchController: UIViewController {
    
    // MARK: - Properties

    private let viewModel = SearchViewModel()
    
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
        viewModel.load(name: pokemonNameTextField.text ?? "")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    // MARK: - Methods
    
    private func bind() {
        viewModel.pokemon = { pokemon in
            self.namePokemonLabel.text = pokemon.name
            let urlPokemon = URL(string: pokemon.image)
            self.pokemonImageView.load(url: urlPokemon!)
            self.attackLabel.text = pokemon.attack
            self.hpLabel.text = pokemon.hp
            self.specialAttackLabel.text = pokemon.specialAttack
            self.specialDefenseLabel.text = pokemon.specialDefense
            self.defenseLabel.text = pokemon.defense
            self.speedLabel.text = pokemon.speed
        }
    }
    
  
    
}

