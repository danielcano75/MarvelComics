//
//  URLCharacterModel.swift
//  MarvelComics
//
//  Created by Daniel Cano Arbelaez on 3/03/22.
//

import Foundation

class URLCharacterModel: Codable {
    let type: String
    let url: String
    
    init(type: String,
         url: String) {
        self.type = type
        self.url = url
    }
}
