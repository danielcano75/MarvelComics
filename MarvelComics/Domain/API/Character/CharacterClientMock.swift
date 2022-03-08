//
//  CharacterClientMock.swift
//  MarvelComics
//
//  Created by Daniel Cano Arbelaez on 3/03/22.
//

import Foundation
import Combine

class CharacterClientMock: APIClient, BaseCharacterClient {
    // MARK: - Properties

    enum ResponseType {
        case success
        case failure
    }
    
    var responseType: ResponseType
    
    var charactersSpy:(() -> Void)?
    var characterSpy:(() -> Void)?
    
    static func make() -> CharacterClientMock {
        return CharacterClientMock()
    }
    
    // MARK: - Initializers
    init(responseType: ResponseType = .success) {
        self.responseType = responseType
    }
    
    func characters(_ endpoint: APIEndpoint, offset: String?, name: String?) -> AnyPublisher<APIResponseModel<CharacterModel>, Error> {
        charactersSpy?()
        switch responseType {
        case .success:
            let response: APIResponseModel<CharacterModel> = APIResponseModel<CharacterModel>.mock(filename: FileNameType.characters.value)
            return Just(response)
                .mapError { _ in ErrorMessage("Bad Url") }
                .eraseToAnyPublisher()
        case .failure:
            return Fail(error: ErrorMessage("Code 500"))
                .eraseToAnyPublisher()
        }
    }
    
    func character(_ endpoint: APIEndpoint, by id: Int) -> AnyPublisher<APIResponseModel<CharacterModel>, Error> {
        characterSpy?()
        switch responseType {
        case .success:
            let response: APIResponseModel<CharacterModel> = APIResponseModel<CharacterModel>.mock(filename: FileNameType.characters.value)
            return Just(response)
                .mapError { _ in ErrorMessage("Bad Url") }
                .eraseToAnyPublisher()
        case .failure:
            return Fail(error: ErrorMessage("Code 500"))
                .eraseToAnyPublisher()
        }
    }
    
    
}
