//
//  BaseCharacterClient.swift
//  MarvelComics
//
//  Created by Daniel Cano Arbelaez on 3/03/22.
//

import Foundation
import Combine

protocol BaseCharacterClient {
    func characters() -> AnyPublisher<[CharacterModel], Error>
    func character(by id: Int) -> AnyPublisher<CharacterModel, Error>
}
