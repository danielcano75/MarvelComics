//
//  CharacterDetailViewController+Builder.swift
//  MarvelComics
//
//  Created by Daniel Cano Arbelaez on 8/03/22.
//

import Foundation
import SDWebImage
import SkeletonView

extension CharacterDetailViewController {
    fileprivate enum ViewTraits {
        static let thumbnailPercentage: CGFloat = 0.592
        static let paddingLabelVertical: CGFloat = 2
        static let separatorHeight: CGFloat = 5
        static let roundCorner: CGFloat = 22
        static let padding: CGFloat = 16
        static let bottom: CGFloat = 16
        static let btnCloseSize: CGSize = CGSize(width: 44, height: 44)
    }
    
    func setUp() {
        view.backgroundColor = .secondary
        
        scrollDetail.translatesAutoresizingMaskIntoConstraints = false
        scrollDetail.isScrollEnabled = true
        scrollDetail.backgroundColor = .clear
        
        contentView.backgroundColor = .clear
        
        let placeholder = UIImage(named: "Placeholder")
        thumbnail.contentMode = .scaleAspectFill
        thumbnail.clipsToBounds = true
        thumbnail.sd_setImage(with: viewModel.character.url(),
                              placeholderImage: placeholder,
                              options: .delayPlaceholder,
                              context: nil)
        
        let symbol = UIImage.SymbolConfiguration(font: .marvel(size: .navigationTitle))
        let close = UIImage(systemName: "xmark")!.withConfiguration(symbol)
        btnClose.setImage(close, for: .normal)
        btnClose.tintColor = .text
        btnClose.backgroundColor = .primary
        btnClose.clipsToBounds = true
        btnClose.layer.cornerRadius = ViewTraits.roundCorner
        btnClose.addTarget(self, action: #selector(closeDetail(sender:)), for: .touchUpInside)
        
        lblTitle.text = viewModel.character.name.uppercased()
        lblTitle.textColor = .text
        lblTitle.font = .marvel(size: .navigationTitle)
        lblTitle.sizeToFit()
        lblTitle.textAlignment = .center
        lblTitle.backgroundColor = .primary
        lblTitle.paddingLeft = ViewTraits.padding
        lblTitle.paddingTop = ViewTraits.paddingLabelVertical
        lblTitle.paddingRight = ViewTraits.padding
        lblTitle.paddingBottom = ViewTraits.paddingLabelVertical
        
        separator.backgroundColor = .primary
        
        lblDescription.text = viewModel.character.characterDescription
        lblDescription.textColor = .text
        lblDescription.font = .marvel(size: .title)
        lblDescription.sizeToFit()
        lblDescription.numberOfLines = .zero
        lblDescription.textAlignment = .left
        
        lblCopyright.text = viewModel.character.characterDescription
        lblCopyright.textColor = .text
        lblCopyright.font = .marvel(size: .text)
        lblCopyright.sizeToFit()
        lblCopyright.backgroundColor = .secondary
        lblCopyright.textAlignment = .left
        lblCopyright.paddingLeft = ViewTraits.padding
        lblCopyright.paddingTop = ViewTraits.paddingLabelVertical
        lblCopyright.paddingRight = ViewTraits.padding
        lblCopyright.paddingBottom =  UIDevice.current.notchSize + ViewTraits.paddingLabelVertical
        
        view.subviews.forEach {
            $0.isUserInteractionEnabled = true
        }
        
        setUpSkeletoneable()
        setupConstraints()
    }

    private func setUpSkeletoneable() {
        contentView.isSkeletonable = true
        thumbnail.isSkeletonable = true
        lblTitle.isSkeletonable = true
        lblDescription.isSkeletonable = true
    }
    
    private func setupConstraints() {
        view.addSubview(scrollDetail)
        scrollDetail.addSubview(contentView)
        contentView.addSubview(thumbnail)
        contentView.addSubview(lblTitle)
        contentView.addSubview(separator)
        contentView.addSubview(lblDescription)
        view.addSubview(btnClose)
        view.addSubview(lblCopyright)
        
        scrollDetail.autoPinEdge(toSuperviewEdge: .top)
        scrollDetail.autoPinEdge(toSuperviewEdge: .bottom)
        scrollDetail.autoSetDimension(.width, toSize: view.bounds.size.width)
        scrollDetail.autoCenterInSuperview()
        
        btnClose.autoPinEdge(toSuperviewEdge: .top, withInset: ViewTraits.padding)
        btnClose.autoPinEdge(toSuperviewEdge: .trailing, withInset: ViewTraits.padding)
        btnClose.autoSetDimensions(to: ViewTraits.btnCloseSize)
        
        contentView.autoPinEdge(toSuperviewEdge: .top)
        contentView.autoPinEdge(toSuperviewEdge: .bottom)
        contentView.autoSetDimension(.width, toSize: view.bounds.size.width)
        
        thumbnail.autoPinEdge(toSuperviewEdge: .leading)
        thumbnail.autoPinEdge(toSuperviewEdge: .top)
        thumbnail.autoPinEdge(toSuperviewEdge: .trailing)
        thumbnail.autoSetDimension(.height, toSize: view.frame.height * ViewTraits.thumbnailPercentage)
        
        lblTitle.autoPinEdge(toSuperviewEdge: .leading, withInset: ViewTraits.padding)
        lblTitle.autoPinEdge(.bottom, to: .bottom, of: thumbnail, withOffset: -ViewTraits.bottom)
        
        separator.autoPinEdge(toSuperviewEdge: .leading)
        separator.autoPinEdge(.top, to: .bottom, of: thumbnail)
        separator.autoPinEdge(toSuperviewEdge: .trailing)
        separator.autoSetDimension(.height, toSize: ViewTraits.separatorHeight)
        
        lblDescription.autoPinEdge(toSuperviewEdge: .leading, withInset: ViewTraits.padding)
        lblDescription.autoPinEdge(.top, to: .bottom, of: separator, withOffset: ViewTraits.padding)
        lblDescription.autoPinEdge(toSuperviewEdge: .trailing, withInset: ViewTraits.padding)
        
        lblCopyright.autoPinEdge(toSuperviewEdge: .leading)
        lblCopyright.autoPinEdge(toSuperviewEdge: .bottom)
        lblCopyright.autoPinEdge(toSuperviewEdge: .trailing)
    }
    
    func updateView() {
        let placeholder = UIImage(named: "Placeholder")
        thumbnail.sd_setImage(with: viewModel.character.url(),
                              placeholderImage: placeholder,
                              options: .delayPlaceholder,
                              context: nil)
        lblTitle.text = viewModel.character.name.uppercased()
        lblDescription.text = viewModel.character.characterDescription
        lblCopyright.text = viewModel.copyright
    }
    
    @objc func closeDetail(sender : UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
