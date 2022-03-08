//
//  CharactersViewModelTest.swift
//  MarvelComicsTests
//
//  Created by Daniel Cano Arbelaez on 8/03/22.
//

import XCTest
@testable import MarvelComics

class CharactersViewModelTest: XCTestCase {
    
    func testFetchCharacters_Success() {
        let controller = CharactersViewController()
        let client = CharacterClientMock(responseType: .success)
        let sut = createCharacterViewModel(controller: controller, client: client)
        let expectation = XCTestExpectation(description: "characters")
        client.charactersSpy = {
            expectation.fulfill()
        }
        sut.fetchCharacters(offset: nil,
                            name: nil)
        wait(for: [expectation], timeout: 0.1)
    }
    
    private func createCharacterViewModel(controller: BaseCharactersViewController,
                                          client: BaseCharacterClient) -> CharactersViewModel {
        CharactersViewModel(controller: controller, client: client)
    }
}
