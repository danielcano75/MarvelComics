//
//  ThumbnailModel.swift
//  MarvelComics
//
//  Created by Daniel Cano Arbelaez on 3/03/22.
//

import Foundation

class ThumbnailModel: Codable {
    let path: String
    let thumbnailExtension: String
    
    init(path: String,
         thumbnailExtension: String) {
        self.path = path
        self.thumbnailExtension = thumbnailExtension
    }
    
    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}
