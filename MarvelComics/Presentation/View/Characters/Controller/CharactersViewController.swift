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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(retryFetchCharacters(_:)),
                                               name: .retry,
                                               object: nil)
    }
    
    @objc private func retryFetchCharacters(_ notification: Notification) {
        viewModel.fetchCharacters(offset: nil, name: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
}

extension CharactersViewController: BaseCharactersViewController {
    func did(change state: ViewState) {
        errorView.isHidden = true
        let gradient = SkeletonGradient(baseColor: .secondary,
                                        secondaryColor: .black)
        switch state {
        case .loading:
            view.startSkeletonAnimation()
            charactersCollectionView.showAnimatedGradientSkeleton(usingGradient: gradient)
            charactersCollectionView.isHidden = false
        case .error(let message):
            charactersCollectionView.isHidden = true
            showError(message: message)
        case .loaded:
            charactersCollectionView.isHidden = false
            view.stopSkeletonAnimation()
            charactersCollectionView.hideSkeleton()
        }
        charactersCollectionView.reloadData()
    }
}
