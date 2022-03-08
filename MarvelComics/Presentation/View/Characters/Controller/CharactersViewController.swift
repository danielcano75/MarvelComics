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
    let imgError: UIImageView = UIImageView(frame: .zero)
    let lblError: UILabel = UILabel(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        viewModel.fetchCharacters(offset: nil, name: nil)
    }
}

extension CharactersViewController: BaseCharactersViewController {
    func did(change state: ViewState) {
        imgError.isHidden = true
        lblError.isHidden = true
        let gradient = SkeletonGradient(baseColor: .secondary,
                                        secondaryColor: .black)
        view.stopSkeletonAnimation()
        charactersCollectionView.hideSkeleton()
        switch state {
        case .loading:
            charactersCollectionView.isHidden = false
            view.startSkeletonAnimation()
            charactersCollectionView.showAnimatedGradientSkeleton(usingGradient: gradient)
        case .error:
            charactersCollectionView.isHidden = true
            imgError.isHidden = false
            lblError.isHidden = false
        case .loaded:
            charactersCollectionView.isHidden = false
            break
        }
        charactersCollectionView.reloadData()
    }
    
    func message(error: String) {
        
    }
}
