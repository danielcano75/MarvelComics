//
//  CharacterViewController+Datasource.swift
//  MarvelComics
//
//  Created by Daniel Cano Arbelaez on 4/03/22.
//

import Foundation
import UIKit

extension CharacterViewController: UITableViewDataSource {
    fileprivate enum ViewTraits {
        static let rowHeight: CGFloat = 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharactersViewCell.identifier) as? CharactersViewCell else {
            return UITableViewCell()
        }
        let character = viewModel.characters[indexPath.row]
        cell.character = character
        cell.setUp()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ViewTraits.rowHeight
    }
}
