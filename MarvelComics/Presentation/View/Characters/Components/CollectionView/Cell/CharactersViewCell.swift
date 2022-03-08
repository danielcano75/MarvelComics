//
//  HeroeViewCell.swift
//  MarvelComics
//
//  Created by Daniel Cano Arbelaez on 4/03/22.
//

import UIKit
import SkeletonView

class CharactersViewCell: UICollectionViewCell {
    static var identifier: String = {
        return String(describing: type(of: self))
    }()
    
    var character: CharacterModel!
    var thumbnail: UIImageView = UIImageView(frame: .zero)
    var contentDescription: UIView = UIView(frame: .zero)
    var lblTitle: UILabel = UILabel(frame: .zero)
    var lblDescription: UILabel = UILabel(frame: .zero)
    
    override func prepareForReuse() {
        super.prepareForReuse()
        isSkeletonable = false
        hideSkeleton()
        contentView.subviews.forEach {
            $0.removeFromSuperview()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
