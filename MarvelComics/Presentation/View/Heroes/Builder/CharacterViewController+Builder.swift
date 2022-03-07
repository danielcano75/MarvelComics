//
//  CharacterViewController+Builder.swift
//  MarvelComics
//
//  Created by Daniel Cano Arbelaez on 4/03/22.
//

import Foundation
import PureLayout

extension CharacterViewController {
    fileprivate enum ViewTraits {
        static let rowHeight: CGFloat = 80
    }
    
    func setUp() {
        title = "Characters"
        
        heroesTableView.delegate = self
        heroesTableView.dataSource = self
        heroesTableView.translatesAutoresizingMaskIntoConstraints = false
        heroesTableView.register(CharactersViewCell.self, forCellReuseIdentifier: CharactersViewCell.identifier)
        heroesTableView.rowHeight = ViewTraits.rowHeight
        heroesTableView.layer.backgroundColor = UIColor.blue.cgColor
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        view.addSubview(heroesTableView)
        
        heroesTableView.autoPinEdgesToSuperviewEdges()
    }
}
