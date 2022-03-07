//
//  HeroeViewCell.swift
//  MarvelComics
//
//  Created by Daniel Cano Arbelaez on 4/03/22.
//

import UIKit

class CharactersViewCell: UITableViewCell {
    static var identifier: String = {
        return String(describing: type(of: self))
    }()
    
    var character: CharacterModel!
    var thumbnail: ThumbnailImageView = ThumbnailImageView(frame: .zero)
    var lblTitle: UILabel = UILabel(frame: .zero)
    var lblDescription: UILabel = UILabel(frame: .zero)
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
