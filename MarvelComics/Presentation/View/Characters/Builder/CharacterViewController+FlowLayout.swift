//
//  CharactersViewController+FlowLayout.swift
//  MarvelComics
//
//  Created by Daniel Cano Arbelaez on 7/03/22.
//

import Foundation
import UIKit

extension CharactersViewController: UICollectionViewDelegateFlowLayout {
    fileprivate enum ViewTraits {
        static let percentage: CGFloat = 1.94
        static let one: CGFloat = 1
        static let itemsPerRow: CGFloat = 2
        static let insets: UIEdgeInsets = UIEdgeInsets(top: 8.0, left: 16.0, bottom: 8.0, right: 16.0)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let space = ViewTraits.insets.left * (ViewTraits.itemsPerRow + ViewTraits.one)
        let width = view.frame.width - space
        let widthPerItem = width / ViewTraits.itemsPerRow
        
        return CGSize(width: widthPerItem,
                      height: widthPerItem * ViewTraits.percentage)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return ViewTraits.insets
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return ViewTraits.insets.left
    }
}
