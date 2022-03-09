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
        controller.viewModel = sut
        let expectation = XCTestExpectation(description: "characters")
        client.charactersSpy = { queryOffset, queryName in
            XCTAssertNil(queryOffset)
            XCTAssertNil(queryName)
            expectation.fulfill()
        }
        sut.fetchCharacters(offset: nil,
                            name: nil)
        wait(for: [expectation], timeout: 0.1)
    }
    
    func testFetchCharactersWithQueryParameters_Success() {
        let offset = "0"
        let name = "3-D Man"
        let controller = CharactersViewController()
        let client = CharacterClientMock(responseType: .success)
        let sut = createCharacterViewModel(controller: controller, client: client)
        controller.viewModel = sut
        let expectation = XCTestExpectation(description: "characters")
        client.charactersSpy = { queryOffset, queryName in
            XCTAssertEqual(offset, queryOffset)
            XCTAssertEqual(name, queryName)
            expectation.fulfill()
        }
        sut.fetchCharacters(offset: offset,
                            name: name)
        wait(for: [expectation], timeout: 0.1)
    }
    
    private func createCharacterViewModel(controller: BaseCharactersViewController,
                                          client: BaseCharacterClient) -> CharactersViewModel {
        CharactersViewModel(controller: controller, client: client)
    }
}
