//
//  CharacterViewController.swift
//  MarvelComics
//
//  Created by Daniel Cano Arbelaez on 4/03/22.
//

import UIKit

class CharacterViewController: BaseViewController {
    var viewModel: BaseCharactersViewModel!
    let heroesTableView = CharacterTableView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        viewModel.fetchCharacters()
        printFonts()
        
    }
    
    func printFonts() {
       for familyName in UIFont.familyNames {
           print("\n-- \(familyName) \n")
           for fontName in UIFont.fontNames(forFamilyName: familyName) {
               print(fontName)
           }
       }
   }
}

extension CharacterViewController: BaseCharactersViewController {
    func refreshData() {
        heroesTableView.reloadData()
    }
    
    func message(error: String) {
        
    }
}
