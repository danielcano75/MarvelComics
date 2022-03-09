//
//  CharacterClient.swift
//  MarvelComics
//
//  Created by Daniel Cano Arbelaez on 3/03/22.
//

import Foundation
import Combine

class CharacterClient: APIClient, BaseCharacterClient {
    static func make() -> CharacterClient {
        return CharacterClient()
    }
    
    func characters(_ endpoint: APIEndpoint, offset: String?, name: String?) -> AnyPublisher<APIResponseModel<CharacterModel>, Error> {
        let limit = URLQueryItem(name: CharacterQueryItem.limit.key, value: CharacterQueryItem.limit.value)
        var components = environment.urlComponents(endpoint: endpoint.value)
        addQuery(item: .offset, with: offset, components: &components)
        addQuery(item: .name, with: name, components: &components)
        components.queryItems?.append(limit)
        guard let url = components.url else {
            fatalError("Cloudn' create URLComponents")
        }
        let request = URLRequest(url: url)
        
        return make(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
    
    private func addQuery(item key: CharacterQueryItem,
                          with value: String?,
                          components: inout URLComponents) {
        if let value = value {
            let item = URLQueryItem(name: key.key, value: value)
            components.queryItems?.append(item)
        }
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
