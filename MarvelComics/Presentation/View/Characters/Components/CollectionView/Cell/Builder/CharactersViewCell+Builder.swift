//
//  CharactersViewCell+Builder.swift
//  MarvelComics
//
//  Created by Daniel Cano Arbelaez on 7/03/22.
//

import Foundation
import PureLayout
import SDWebImage
import SkeletonView

extension CharactersViewCell {
    fileprivate enum ViewTraits {
        static let thumbnailPercentage: CGFloat = 0.592
        static let spacing: CGFloat = 4
        static let padding: CGFloat = 8
        static let horizontalPadding: CGFloat = 16
        static let radius: CGFloat = 20
    }
    
    func setUp() {
        contentView.round(corners: [.bottomRight],
                          radius: ViewTraits.radius)
        contentView.backgroundColor = .primary
        
        let placeholder = UIImage(named: "Placeholder")
        thumbnail.contentMode = .scaleAspectFill
        thumbnail.sd_setImage(with: character.url(),
                              placeholderImage: placeholder,
                              options: .delayPlaceholder,
                              context: nil)
        
        contentDescription.backgroundColor = .secondary
        
        lblTitle.text = character.name.uppercased()
        lblTitle.textColor = .text
        lblTitle.textAlignment = .left
        lblTitle.font = .marvel(size: .title)
        
        lblDescription.text = character.characterDescription
        lblDescription.textColor = .text
        lblDescription.font = .marvel(size: .text)
        lblDescription.numberOfLines = .zero
        lblDescription.sizeToFit()
        
        setUpSkeletoneable()
        setupConstraints()
    }
    
    private func setUpSkeletoneable() {
        isSkeletonable = true
        thumbnail.isSkeletonable = true
        contentDescription.isSkeletonable = true
        lblTitle.isSkeletonable = true
        lblDescription.isSkeletonable = true
    }
    
    private func setupConstraints() {
        contentView.addSubview(thumbnail)
        contentView.addSubview(contentDescription)
        
        thumbnail.autoPinEdge(toSuperviewEdge: .leading)
        thumbnail.autoPinEdge(toSuperviewEdge: .top)
        thumbnail.autoPinEdge(toSuperviewEdge: .trailing)
        thumbnail.autoSetDimension(.height, toSize: contentView.frame.height * ViewTraits.thumbnailPercentage)
        
        contentDescription.autoPinEdge(toSuperviewEdge: .leading)
        contentDescription.autoPinEdge(.top, to: .bottom, of: thumbnail, withOffset: ViewTraits.spacing)
        contentDescription.autoPinEdge(toSuperviewEdge: .trailing)
        contentDescription.autoPinEdge(toSuperviewEdge: .bottom)
        
        contentDescription.addSubview(lblTitle)
        contentDescription.addSubview(lblDescription)
        
        lblTitle.autoPinEdge(toSuperviewEdge: .leading, withInset: ViewTraits.horizontalPadding)
        lblTitle.autoPinEdge(toSuperviewEdge: .top, withInset: ViewTraits.padding)
        lblTitle.autoPinEdge(toSuperviewEdge: .trailing, withInset: ViewTraits.horizontalPadding)
        
        lblDescription.autoPinEdge(toSuperviewEdge: .leading, withInset: ViewTraits.horizontalPadding)
        lblDescription.autoPinEdge(.top, to: .bottom, of: lblTitle, withOffset: ViewTraits.padding)
        lblDescription.autoPinEdge(toSuperviewEdge: .trailing, withInset: ViewTraits.horizontalPadding)
        lblDescription.autoPinEdge(toSuperviewEdge: .bottom, withInset: ViewTraits.padding)
    }
}
