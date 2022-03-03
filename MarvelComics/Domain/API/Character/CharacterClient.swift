//
//  CharacterClient.swift
//  MarvelComics
//
//  Created by Daniel Cano Arbelaez on 3/03/22.
//

import Foundation
import Combine

class CharacterClient: APIClient, BaseCharacterClient {
    
    func characters(_ endpoint: APIEndpoint) -> AnyPublisher<[CharacterModel], Error> {
        guard let url = environment.urlComponents(endpoint: endpoint.value).url else {
            fatalError("Cloudn' create URLComponents")
        }
        let request = URLRequest(url: url)
        
        return make(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
    
    func character(_ endpoint: APIEndpoint, by id: Int) -> AnyPublisher<CharacterModel, Error> {
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
