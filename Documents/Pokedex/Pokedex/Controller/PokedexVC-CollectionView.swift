//
//  Pokedex-CollectionView.swift
//  Pokedex
//
//  Created by Maggie Yi on 2020-02-13.
//  Copyright © 2020 Maggie Yi. All rights reserved.
//

import UIKit

extension PokedexVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isFiltering {
          return filteredPokemon.count
        }
        return PokemonList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonCell", for: indexPath) as! PokedexCollectionViewCell
        
        //aesthetics
        cell.layer.cornerRadius = 15
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
        cell.layer.shadowRadius = 10
        cell.layer.shadowOpacity = 0.24
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.layer.cornerRadius).cgPath
        
        guard let url = URL(string: PokemonList[indexPath.row].imageUrl) else {
            return cell
        }
        guard let data = try? Data(contentsOf: url) else {
            return cell
        }

        if isFiltering {
            guard let urlFiltered = URL(string: filteredPokemon[indexPath.row].imageUrl) else {
                return cell
            }
            guard let dataFiltered = try? Data(contentsOf: urlFiltered) else {
                return cell
            }
          cell.pokemonImage.image = UIImage(data:dataFiltered)
          cell.pokemonName.text = filteredPokemon[indexPath.row].name
          cell.pokemonID.text = "ID: " + String(filteredPokemon[indexPath.row].id)
        } else {
          cell.pokemonImage.image = UIImage(data:data)
          cell.pokemonName.text = PokemonList[indexPath.row].name
          cell.pokemonID.text = "ID: " + String(PokemonList[indexPath.row].id)
        }
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(2 - 1))
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(2))
        if (grid == false) {
            return CGSize(width: size*2, height: size)
        }
        return CGSize(width: size, height: size-20)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPokemonSegue" {
            if let destVC = segue.destination as? PokemonVC, segue.identifier == "toPokemonSegue" {
                segue.destination.modalPresentationStyle = .fullScreen
                
                if isFiltering {
                    pokemonStatsDict["attack"] = String(filteredPokemon[rowNumber].attack)
                    pokemonStatsDict["defense"] = String(filteredPokemon[rowNumber].defense)
                    pokemonStatsDict["health"] = String(filteredPokemon[rowNumber].health)
                    pokemonStatsDict["specialAttack"] = String(filteredPokemon[rowNumber].specialAttack)
                    pokemonStatsDict["specialDefense"] = String(filteredPokemon[rowNumber].specialDefense)
                    pokemonStatsDict["speed"] = String(filteredPokemon[rowNumber].speed)
                    pokemonStatsDict["total"] = String(filteredPokemon[rowNumber].total)
                    
                    var types = ""
                    var first = true
                    for type in filteredPokemon[rowNumber].types {
                        if (first == true) {
                            types.append(type.rawValue)
                            first = false
                        } else {
                            types.append(", \(type.rawValue)")
                        }
                    }
                    pokemonStatsDict["types"] = types
                    destVC.pokemonDictReceived = pokemonStatsDict
                    destVC.imageURL = filteredPokemon[rowNumber].imageUrl
                    destVC.pokemonNameReceived = filteredPokemon[rowNumber].name
                    destVC.pokemonIDReceived = String(filteredPokemon[rowNumber].id)
                } else {
                    pokemonStatsDict["attack"] = String(PokemonList[rowNumber].attack)
                    pokemonStatsDict["defense"] = String(PokemonList[rowNumber].defense)
                    pokemonStatsDict["health"] = String(PokemonList[rowNumber].health)
                    pokemonStatsDict["specialAttack"] = String(PokemonList[rowNumber].specialAttack)
                    pokemonStatsDict["specialDefense"] = String(PokemonList[rowNumber].specialDefense)
                    pokemonStatsDict["speed"] = String(PokemonList[rowNumber].speed)
                    pokemonStatsDict["total"] = String(PokemonList[rowNumber].total)
                    
                    var types = ""
                    var first = true
                    for type in PokemonList[rowNumber].types {
                        if (first == true) {
                            types.append(type.rawValue)
                            first = false
                        } else {
                            types.append(", \(type.rawValue)")
                        }
                    }
                    pokemonStatsDict["types"] = types
                    destVC.pokemonDictReceived = pokemonStatsDict
                    destVC.imageURL = PokemonList[rowNumber].imageUrl
                    destVC.pokemonNameReceived = PokemonList[rowNumber].name
                    destVC.pokemonIDReceived = String(PokemonList[rowNumber].id)
                }
                
            }
            
        }
        if segue.identifier == "toAdvancedSegue" {
            if let destVC = segue.destination as? AdvancedFiltersVC, segue.identifier == "toAdvancedSegue" {
                segue.destination.modalPresentationStyle = .fullScreen
                destVC.delegate = self
            }
        }
    }
    
    // Set the indexPath of the selected item as the sender for the segue
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        rowNumber = indexPath.row
        performSegue(withIdentifier: "toPokemonSegue", sender: self)
    }
    
    
    
}
