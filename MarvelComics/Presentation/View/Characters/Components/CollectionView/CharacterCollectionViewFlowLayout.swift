//
//  CharacterCollectionViewFlowLayout.swift
//  MarvelComics
//
//  Created by Daniel Cano Arbelaez on 7/03/22.
//

import UIKit

class CharacterCollectionViewFlowLayout: UICollectionViewFlowLayout {
    fileprivate enum ViewTraits {
        static let itemSpacing: CGFloat = 16.0
        static let lineSpacing: CGFloat = 8.0
        static let insets: UIEdgeInsets = UIEdgeInsets(top: 8.0, left: 16.0, bottom: 8.0, right: 16.0)
    }
    
    override init() {
        super.init()
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp() {
        minimumInteritemSpacing = ViewTraits.itemSpacing
        minimumLineSpacing = ViewTraits.lineSpacing
        sectionInset = ViewTraits.insets
    }
}
