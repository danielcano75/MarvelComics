//
//  CharacterClient.swift
//  MarvelComics
//
//  Created by Daniel Cano Arbelaez on 3/03/22.
//

import Foundation
import Combine

class CharacterClient: APIClient, BaseCharacterClient {
    
    func characters() -> AnyPublisher<[CharacterModel], Error> {
        guard let url = environment.urlComponents(endpoint: APIEndpoint.characters.value).url else {
            fatalError("Cloudn' create URLComponents")
        }
        let request = URLRequest(url: url)
        
        return make(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
    
    func character(by id: Int) -> AnyPublisher<CharacterModel, Error> {
        let enpoint = APIEndpoint.characters.value + "/\(id)"
        guard let url = environment.urlComponents(endpoint: enpoint).url else {
            fatalError("Cloudn' create URLComponents")
        }
        let request = URLRequest(url: url)
        
        return make(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
}
