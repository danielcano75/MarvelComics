//
//  CharactersViewController+Delegate.swift
//  MarvelComics
//
//  Created by Daniel Cano Arbelaez on 4/03/22.
//

import Foundation
import UIKit

extension CharactersViewController: UICollectionViewDelegate {
    fileprivate enum ViewTraits {
        static let one: Int = 1
        static let minSizeToFetch: Int = 99
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        if viewModel.characters.count > ViewTraits.minSizeToFetch {
            if indexPath.row == viewModel.characters.count - ViewTraits.one {
                viewModel.fetchCharacters(offset: "\(viewModel.characters.count)", name: nil)
            }
        }
    }
}
