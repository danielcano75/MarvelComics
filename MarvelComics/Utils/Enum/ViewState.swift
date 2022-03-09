//
//  ViewState.swift
//  MarvelComics
//
//  Created by Daniel Cano Arbelaez on 8/03/22.
//

import Foundation

enum ViewState {
    case loading
    case error(message: String)
    case loaded
}
