//
//  BaseCharacterClient.swift
//  MarvelComics
//
//  Created by Daniel Cano Arbelaez on 3/03/22.
//

import Foundation
import Combine

enum CharacterQueryItem: String {
    case limit = "limit"
    case offset = "offset"
    case name = "nameStartsWith"
    
    var key: String {
        rawValue
    }
    
    var value: String {
        switch self {
        case .limit:
            return "100"
        default:
            return ""
        }
    }
}

protocol BaseCharacterClient {
    func characters(_ endpoint: APIEndpoint, offset: String?, name: String?) -> AnyPublisher<APIResponseModel<CharacterModel>, Error>
    func character(_ endpoint: APIEndpoint, by id: Int) -> AnyPublisher<APIResponseModel<CharacterModel>, Error>
}
