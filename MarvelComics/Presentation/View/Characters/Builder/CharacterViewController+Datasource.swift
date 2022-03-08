//
//  CharactersViewController+Datasource.swift
//  MarvelComics
//
//  Created by Daniel Cano Arbelaez on 4/03/22.
//

import Foundation
import UIKit
import SkeletonView

extension CharactersViewController: SkeletonCollectionViewDataSource {
    func collectionSkeletonView(_ skeletonView: UICollectionView,
                                cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return CharactersViewCell.identifier
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return viewModel.characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharactersViewCell.identifier,
                                                            for: indexPath) as? CharactersViewCell else {
            return UICollectionViewCell()
        }
        let character = viewModel.characters[indexPath.row]
        cell.character = character
        cell.setUp()
        return cell
    }
    
    func collectionSkeletonView(_ skeletonView: UICollectionView,
                                numberOfItemsInSection section: Int) -> Int {
        return viewModel.characters.count
    }
    
    func collectionSkeletonView(_ skeletonView: UICollectionView,
                                skeletonCellForItemAt indexPath: IndexPath) -> UICollectionViewCell? {
        let cell = skeletonView.dequeueReusableCell(withReuseIdentifier: CharactersViewCell.identifier,
                                                    for: indexPath) as? CharactersViewCell
        cell?.isSkeletonable = true
        return cell
    }
    
    func collectionSkeletonView(_ skeletonView: UICollectionView,
                                prepareCellForSkeleton cell: UICollectionViewCell,
                                at indexPath: IndexPath) {
        let character = viewModel.characters[indexPath.row]
        let cell = cell as? CharactersViewCell
        cell?.character = character
        cell?.setUp()
        cell?.isSkeletonable = true
    }
}
