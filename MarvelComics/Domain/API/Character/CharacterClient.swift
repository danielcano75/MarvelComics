//
//  CharacterClient.swift
//  MarvelComics
//
//  Created by Daniel Cano Arbelaez on 3/03/22.
//

import Foundation
import Combine

class CharacterClient: APIClient, BaseCharacterClient {
    enum CharacterQueryItem: String {
        case limit = "limit"
        
        var key: String {
            rawValue
        }
        
        var value: String {
            switch self {
            case .limit:
                return "100"
            }
        }
    }
    
    static func make() -> CharacterClient {
        return CharacterClient()
    }
    
    func characters(_ endpoint: APIEndpoint) -> AnyPublisher<APIResponseModel<CharacterModel>, Error> {
        let limit = URLQueryItem(name: CharacterQueryItem.limit.key, value: CharacterQueryItem.limit.value)
        var components = environment.urlComponents(endpoint: endpoint.value)
        components.queryItems?.append(limit)
        guard let url = components.url else {
            fatalError("Cloudn' create URLComponents")
        }
        let request = URLRequest(url: url)
        
        return make(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
    
    func character(_ endpoint: APIEndpoint, by id: Int) -> AnyPublisher<APIResponseModel<CharacterModel>, Error> {
        let enpoint = endpoint.value + "/\(id)"
        guard let url = environment.urlComponents(endpoint: enpoint).url else {
            fatalError("Cloudn' create URLComponents")
        }
        let request = URLRequest(url: url)
        
        return make(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
}
