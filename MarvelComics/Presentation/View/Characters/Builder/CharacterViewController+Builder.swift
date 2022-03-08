//
//  CharactersViewController+Builder.swift
//  MarvelComics
//
//  Created by Daniel Cano Arbelaez on 4/03/22.
//

import Foundation
import PureLayout
import SkeletonView

extension CharactersViewController {
    fileprivate enum ViewTraits {
        static let padding: CGFloat = 8
        static let imageSize: CGSize = CGSize(width: 207, height: 207)
    }
    
    func setUp() {
        title = "Characters".uppercased()
        navigationItem.searchController = searchController
        navigationItem.searchController?.searchBar.delegate = self
        navigationItem.searchController?.searchBar.tintColor = .text
        navigationItem.searchController?.searchBar.searchTextField.textColor = .text
        
        charactersCollectionView.delegate = self
        charactersCollectionView.dataSource = self
        charactersCollectionView.translatesAutoresizingMaskIntoConstraints = false
        charactersCollectionView.register(CharactersViewCell.self, forCellWithReuseIdentifier: CharactersViewCell.identifier)
        charactersCollectionView.layer.backgroundColor = UIColor.background.cgColor
        charactersCollectionView.isSkeletonable = true
        
        imgError.image = UIImage(named: "NotFound")
        imgError.contentMode = .scaleAspectFit
        
        lblError.textColor = .secondary
        lblError.textAlignment = .center
        lblError.font = .marvel(size: .navigationTitle)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        view.addSubview(charactersCollectionView)
        view.addSubview(imgError)
        view.addSubview(lblError)
        
        charactersCollectionView.autoPinEdgesToSuperviewEdges()
        
        imgError.autoCenterInSuperview()
        imgError.autoSetDimensions(to: ViewTraits.imageSize)
        
        lblError.autoPinEdge(toSuperviewEdge: .leading, withInset: ViewTraits.padding)
        lblError.autoPinEdge(.top, to: .bottom, of: imgError, withOffset: ViewTraits.padding)
        lblError.autoPinEdge(toSuperviewEdge: .leading, withInset: ViewTraits.padding)
        lblError.autoAlignAxis(toSuperviewAxis: .horizontal)
    }
}
