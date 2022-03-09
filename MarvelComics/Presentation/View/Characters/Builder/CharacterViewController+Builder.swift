//
//  CharactersViewController+Builder.swift
//  MarvelComics
//
//  Created by Daniel Cano Arbelaez on 4/03/22.
//

import Foundation
import PureLayout
import SkeletonView

extension CharactersViewController {
    func setUp() {
        view.backgroundColor = .background
        title = "Characters".uppercased()
        navigationItem.searchController = searchController
        navigationItem.searchController?.searchBar.delegate = self
        navigationItem.searchController?.searchBar.tintColor = .text
        navigationItem.searchController?.searchBar.searchTextField.textColor = .text
        
        charactersCollectionView.delegate = self
        charactersCollectionView.dataSource = self
        charactersCollectionView.translatesAutoresizingMaskIntoConstraints = false
        charactersCollectionView.register(CharactersViewCell.self, forCellWithReuseIdentifier: CharactersViewCell.identifier)
        charactersCollectionView.layer.backgroundColor = UIColor.background.cgColor
        charactersCollectionView.isSkeletonable = true
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        view.addSubview(charactersCollectionView)
        view.addSubview(errorView)
        
        charactersCollectionView.autoPinEdgesToSuperviewEdges()
        
        errorView.autoPinEdgesToSuperviewEdges()
    }
}
