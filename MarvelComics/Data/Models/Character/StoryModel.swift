//
//  StoryModel.swift
//  MarvelComics
//
//  Created by Daniel Cano Arbelaez on 3/03/22.
//

import Foundation

enum StoryType: String, Codable {
    case cover = "cover"
    case interiorStory = "interiorStory"
}

class StoryModel: Codable {
    let resourceURI: String
    let name: String
    let type: StoryType
    
    init(resourceURI: String,
         name: String,
         type: StoryType) {
        self.resourceURI = resourceURI
        self.name = name
        self.type = type
    }
}
