//
//  PokemonVC.swift
//  Pokedex
//
//  Created by Maggie Yi on 2020-02-13.
//  Copyright © 2020 Maggie Yi. All rights reserved.
//

import UIKit

class PokemonVC: UIViewController {

    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonID: UILabel!
    
    @IBOutlet weak var attack: UILabel!
    @IBOutlet weak var defense: UILabel!
    @IBOutlet weak var health: UILabel!
    @IBOutlet weak var specialAttack: UILabel!
    @IBOutlet weak var specialDefense: UILabel!
    @IBOutlet weak var speed: UILabel!
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var types: UILabel!
    
    
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var imageURL = ""
    var pokemonNameReceived = ""
    var pokemonDictReceived: [String: String] = [:]
    var pokemonIDReceived = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        pokemonName.text = pokemonNameReceived
        attack.text = "Attack: " + pokemonDictReceived["attack"]!
        defense.text = "Defense: " + pokemonDictReceived["defense"]!
        health.text = "Health: " + pokemonDictReceived["health"]!
        specialAttack.text = "Special Attack: " + pokemonDictReceived["specialAttack"]!
        specialDefense.text = "Special Defense: " + pokemonDictReceived["specialDefense"]!
        speed.text = "Speed: " + pokemonDictReceived["speed"]!
        total.text = "Total: " + pokemonDictReceived["total"]!
        types.text = "Types: " + pokemonDictReceived["types"]!
        
        pokemonID.text = "ID: \(pokemonIDReceived)"
        guard let url = URL(string: imageURL) else { return }
        guard let data = try? Data(contentsOf: url) else { return }
        pokemonImage.image = UIImage(data:data)
        
        
    }
    
    

    
    
}
