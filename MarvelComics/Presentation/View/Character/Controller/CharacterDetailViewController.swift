//
//  CharacterDetailViewController.swift
//  MarvelComics
//
//  Created by Daniel Cano Arbelaez on 8/03/22.
//

import UIKit
import SkeletonView

class CharacterDetailViewController: BaseViewController {
    var characterId: Int!
    var viewModel: BaseCharacterDetailViewModel!
    
    let scrollDetail: UIScrollView = UIScrollView(frame: .zero)
    let contentView: UIView = UIView(frame: .zero)
    let thumbnail: UIImageView = UIImageView(frame: .zero)
    let btnClose: UIButton = UIButton(frame: .zero)
    let lblTitle: PaddingLabel = PaddingLabel(frame: .zero)
    let lblDescription: UILabel = UILabel(frame: .zero)
    let separator: UIView = UIView(frame: .zero)
    let lblCopyright: PaddingLabel = PaddingLabel(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        viewModel.fetchCharacter(by: characterId)
    }
}

extension CharacterDetailViewController: BaseCharacterDetailViewController {
    func did(change state: ViewState) {
        let gradient = SkeletonGradient(baseColor: .secondary,
                                        secondaryColor: .black)
        switch state {
        case .loading:
            view.startSkeletonAnimation()
            contentView.showAnimatedGradientSkeleton(usingGradient: gradient)
        case .error:
            print("ERROR!!!")
        case .loaded:
            updateView()
            view.stopSkeletonAnimation()
            contentView.hideSkeleton()
        }
    }
    
    func message(error: String) {
        
    }
}
