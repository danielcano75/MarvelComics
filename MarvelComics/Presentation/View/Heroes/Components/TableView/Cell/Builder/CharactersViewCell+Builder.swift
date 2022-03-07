//
//  CharactersViewCell+Builder.swift
//  MarvelComics
//
//  Created by Daniel Cano Arbelaez on 7/03/22.
//

import Foundation
import PureLayout
import SDWebImage

extension CharactersViewCell {
    fileprivate enum ViewTraits {
        static let padding: CGFloat = 8
        static let horizontalPadding: CGFloat = 16
        static let thumbnailSize: CGSize = CGSize(width: 44, height: 44)
    }
    
    func setUp() {
        let placeholder = UIImage(named: "Placeholder")
        thumbnail.contentMode = .scaleAspectFill
        thumbnail.sd_setImage(with: character.url(),
                              placeholderImage: placeholder,
                              options: .delayPlaceholder,
                              context: nil)
        
        lblTitle.text = character.name
        lblTitle.font = .marvel(size: .title)
        
        lblDescription.text = character.characterDescription
        lblDescription.font = .marvel(size: .text)
        lblDescription.numberOfLines = .zero
        lblDescription.sizeToFit()
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        contentView.addSubview(thumbnail)
        contentView.addSubview(lblTitle)
        contentView.addSubview(lblDescription)
        
        thumbnail.autoPinEdge(toSuperviewEdge: .leading, withInset: ViewTraits.horizontalPadding)
        thumbnail.autoAlignAxis(toSuperviewAxis: .horizontal)
        thumbnail.autoSetDimensions(to: ViewTraits.thumbnailSize)
        
        lblTitle.autoPinEdge(.leading, to: .trailing, of: thumbnail, withOffset: ViewTraits.padding)
        lblTitle.autoPinEdge(toSuperviewEdge: .top, withInset: ViewTraits.padding)
        lblTitle.autoPinEdge(toSuperviewEdge: .trailing, withInset: ViewTraits.horizontalPadding)
        
        lblDescription.autoPinEdge(.leading, to: .trailing, of: thumbnail, withOffset: ViewTraits.padding)
        lblDescription.autoPinEdge(.top, to: .bottom, of: lblTitle, withOffset: ViewTraits.padding)
        lblDescription.autoPinEdge(toSuperviewEdge: .trailing, withInset: ViewTraits.horizontalPadding)
        lblDescription.autoPinEdge(toSuperviewEdge: .bottom, withInset: ViewTraits.padding)
    }
}
