//
//  ComicsModel.swift
//  MarvelComics
//
//  Created by Daniel Cano Arbelaez on 3/03/22.
//

import Foundation

class ComicsModel: Codable {
    let available: Int
    let collectionURI: String
    let items: [ComicModel]
    let returned: Int
    
    init(available: Int,
         collectionURI: String,
         items: [ComicModel],
         returned: Int) {
        self.available = available
        self.collectionURI = collectionURI
        self.items = items
        self.returned = returned
    }
}
