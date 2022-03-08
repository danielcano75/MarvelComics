//
//  CharactersViewController+SearchDelegate.swift
//  MarvelComics
//
//  Created by Daniel Cano Arbelaez on 7/03/22.
//

import UIKit

extension CharactersViewController: UISearchBarDelegate {
    static let minSearchTerm: Int = 3
    
    func searchBar(_ searchBar: UISearchBar,
                   textDidChange searchText: String) {
        if searchText.count > CharactersViewController.minSearchTerm {
            viewModel.fetchCharacters(offset: nil, name: searchText)
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchBar.text?.count ?? .zero > CharactersViewController.minSearchTerm {
            viewModel.fetchCharacters(offset: nil, name: searchBar.text)
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.fetchCharacters(offset: nil, name: nil)
    }
}
