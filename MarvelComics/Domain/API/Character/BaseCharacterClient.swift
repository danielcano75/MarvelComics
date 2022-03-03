//
//  BaseCharacterClient.swift
//  MarvelComics
//
//  Created by Daniel Cano Arbelaez on 3/03/22.
//

import Foundation
import Combine

protocol BaseCharacterClient {
    func characters(_ endpoint: APIEndpoint) -> AnyPublisher<[CharacterModel], Error>
    func character(_ endpoint: APIEndpoint, by id: Int) -> AnyPublisher<CharacterModel, Error>
}
