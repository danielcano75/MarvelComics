//
//  BaseCharactersViewController.swift
//  MarvelComics
//
//  Created by Daniel Cano Arbelaez on 7/03/22.
//

import Foundation

protocol BaseCharactersViewController {
    func did(change state: CharactersViewState)
    func message(error: String)
}
