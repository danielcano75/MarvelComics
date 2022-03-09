//
//  ErrorMessage.swift
//  MarvelComics
//
//  Created by Daniel Cano Arbelaez on 3/03/22.
//

import Foundation

struct ErrorMessage: Swift.Error, Equatable {
    let message: String
    
    init(_ message: String) {
        self.message = message
    }
}
