//
//  PokedexVC.swift
//  Pokedex
//
//  Created by Maggie Yi on 2020-02-12.
//  Copyright © 2020 Maggie Yi. All rights reserved.
//

import UIKit

protocol isAbleToReceiveData {
    func pass(data: [String:Bool])  //data: string is an example parameter
    func passInt(data: [String:Int])
} 

class PokedexVC: UIViewController, isAbleToReceiveData {

    
    
    var isFilteringBool = false
    var notFirstTime = false
    
    var advancedDictReceived: [String: Bool] = [:]
    var advancedDictNumReceived: [String: Int] = [:]
    
    func pass(data: [String:Bool]) {
        var test = true
        for (s, i) in data {
            if (i == true) {
                test = false
            }
        }
        
        if (test == false) {
            advancedDictReceived = data
            filterContentForType(advancedDictReceived)
            isFilteringBool = true
        } else {
            
        }
    }
    
    func passInt(data: [String : Int]) {
//        advancedDictNumReceived = data
//        filterContentForType(advancedDictReceived)
//        isFilteringBool = true
    }
    
    
    var grid = true
    
    @IBOutlet weak var viewToggleName: UISegmentedControl!
    
    
    @IBAction func viewToggleFunc(_ sender: Any) {
        switch viewToggleName.selectedSegmentIndex
        {
        case 0:
            grid = true
        case 1:
            grid = false
        default:
            break
        }
        
        collectionView.reloadData()
        
    }
    @IBOutlet weak var collectionView: UICollectionView!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    
    var filteredPokemon: [Pokemon] = []
    
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    var isFiltering: Bool {
      return searchController.isActive && !isSearchBarEmpty || isFilteringBool == true
    }


    var PokemonList: [Pokemon] = PokemonGenerator.getPokemonArray()
    var rowNumber = 0;
    var pokemonStatsDict: [String : String] = ["attack": "", "defense" :"", "health" : "", "specialAttack": "", "specialDefense": "", "speed": "", "total":"", "types":""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    
        // Do any additional setup after loading the view.
        searchController.searchResultsUpdater = self
        // 2
        searchController.obscuresBackgroundDuringPresentation = false
        // 3
        searchController.searchBar.placeholder = "Search Pokemon..."
        // 4
        navigationItem.searchController = searchController
        // 5
        definesPresentationContext = true
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    

    func filterContentForSearchText(_ searchText: String,
                                    scope: String = "All") {
      filteredPokemon = PokemonList.filter { (pokemon: Pokemon) -> Bool in
        return pokemon.name.lowercased().contains(searchText.lowercased())
      }

      collectionView.reloadData()
    }
    
    func filterContentForType(_ dict: [String:Bool]) {
        filteredPokemon = PokemonList.filter { (pokemon: Pokemon) -> Bool in
            for type in pokemon.types {
                if (dict[type.rawValue] == Optional(true)){
                    return true
                }
            }
            return false
        }
        collectionView.reloadData()
    }
    
//    func filterContentForNum(_ dict: [String:Int]) {
//        filteredPokemon = PokemonList.filter { (pokemon: Pokemon) -> Bool in
//            
//            
//        }
//        collectionView.reloadData()
//    }

}

extension PokedexVC: UISearchResultsUpdating {
    
  func updateSearchResults(for searchController: UISearchController) {
    print("updateSearchResults")
    
    let searchBar = searchController.searchBar
    filterContentForSearchText(searchBar.text!)
  }
}


