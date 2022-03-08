//
//  CharactersViewController.swift
//  MarvelComics
//
//  Created by Daniel Cano Arbelaez on 4/03/22.
//

import UIKit
import SkeletonView

class CharactersViewController: BaseViewController {
    var viewModel: BaseCharactersViewModel!
    let searchController = UISearchController()
    let charactersCollectionView = CharacterCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        viewModel.fetchCharacters(offset: nil, name: nil)
    }
}

extension CharactersViewController: BaseCharactersViewController {
    func did(change state: CharactersViewState) {
        switch state {
        case .loading:
            view.startSkeletonAnimation()
            charactersCollectionView.showAnimatedGradientSkeleton()
        case .error:
            print("ERROR!!!")
        case .loaded:
            view.stopSkeletonAnimation()
            charactersCollectionView.hideSkeleton()
        }
        charactersCollectionView.reloadData()
    }
    
    func message(error: String) {
        
    }
}
