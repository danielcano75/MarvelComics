//
//  CharacterModel.swift
//  MarvelComics
//
//  Created by Daniel Cano Arbelaez on 3/03/22.
//

import Foundation

class CharacterModel: NSObject, Codable {
    let id: Int
    let name: String
    let characterDescription: String
    let modified: String
    let thumbnail: ThumbnailModel
    let resourceURI: String
    let comics: ComicsModel
    let series: ComicsModel
    let stories: StoriesModel
    let events: ComicsModel
    let urls: [URLCharacterModel]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case characterDescription = "description"
        case modified
        case thumbnail
        case resourceURI
        case comics
        case series
        case stories
        case events
        case urls
    }
}

extension CharacterModel {
    func url() -> URL? {
        return URL(string: thumbnail.path + "." + thumbnail.thumbnailExtension)
    }
}

// MARK: Mock -
extension CharacterModel {
    static func mock(filename: String) -> CharacterModel {
        let character: CharacterModel = CharacterModel.JSONToObject(with: filename)
        return character
    }
}
