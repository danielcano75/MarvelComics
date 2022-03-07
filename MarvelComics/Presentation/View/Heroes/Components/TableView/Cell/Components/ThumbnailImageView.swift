//
//  ThumbnailImageView.swift
//  MarvelComics
//
//  Created by Daniel Cano Arbelaez on 7/03/22.
//

import UIKit

class ThumbnailImageView: UIImageView {
    fileprivate enum ViewTraits {
        static let radius: CGFloat = 2.0
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let radius: CGFloat = bounds.size.width / ViewTraits.radius
        layer.cornerRadius = radius
        clipsToBounds = true
    }
}
