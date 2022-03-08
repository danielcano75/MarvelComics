//
//  BaseCharactersViewModel.swift
//  MarvelComics
//
//  Created by Daniel Cano Arbelaez on 4/03/22.
//

import Foundation

protocol BaseCharactersViewModel {
    var characters: [CharacterModel] { get set }
    func fetchCharacters(offset: String?, name: String?)
}
