//
//  PokedexController.swift
//  Pokedex
//
//  Created by Maggie Yi on 2/14/20.
//  Copyright © 2020 Mobile Developers at Berkeley. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PokedexCell"

class PokedexController : UICollectionViewController {
    // MARK:  - properties
    var searchBar: UISearchBar!
    var pokemon = [Pokemon]()
    var filteredPokemon = [Pokemon]()
    var inSearchMode = false
    

    // MARK:  - Init
    @IBOutlet var Pokedex: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewComponents()
        
        }
    
    // MARK: - Selectors
    @objc func showSearchBar() {
        return
        //print(124)
    }
    // MARK: - Helper Functions
    /* UI Config */
    func configureViewComponents() {
        collectionView.backgroundColor = .white
        
        navigationController?.navigationBar.barTintColor = .mainBlue()
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isTranslucent = false
        
        navigationItem.title = "Pokedex"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(showSearchBar))
        
        navigationItem.rightBarButtonItem?.tintColor = .white
        
        collectionView.register(PokedexCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        }
    
}

extension PokedexController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PokedexCell
        cell.backgroundColor = .systemYellow
        return cell
        
        }
    }

extension PokedexController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 32, left: 8, bottom: 8, right: 8)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (view.frame.width - 36) / 3
        return CGSize(width: width, height: width)
        
    }
}


    
    

