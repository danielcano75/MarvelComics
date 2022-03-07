//
//  BaseCharacterClient.swift
//  MarvelComics
//
//  Created by Daniel Cano Arbelaez on 3/03/22.
//

import Foundation
import Combine

protocol BaseCharacterClient {
    func characters(_ endpoint: APIEndpoint) -> AnyPublisher<APIResponseModel<CharacterModel>, Error>
    func character(_ endpoint: APIEndpoint, by id: Int) -> AnyPublisher<APIResponseModel<CharacterModel>, Error>
}
