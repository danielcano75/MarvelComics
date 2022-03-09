//
//  CharacterDetailViewModelTest.swift
//  MarvelComicsTests
//
//  Created by Daniel Cano Arbelaez on 9/03/22.
//

import XCTest
@testable import MarvelComics

class CharacterDetailViewModelTest: XCTestCase {
    
    func testFetchCharacterById_Success() {
        let charcterId: Int = 1011334
        let controller = CharacterDetailViewController()
        let client = CharacterClientMock(responseType: .success)
        let sut = createCharacterDetailViewModel(controller: controller, client: client)
        controller.characterId = charcterId
        controller.viewModel = sut
        let expectation = XCTestExpectation(description: "character")
        client.characterSpy = { queryCharacterId in
            XCTAssertEqual(charcterId, queryCharacterId)
            expectation.fulfill()
        }
        sut.fetchCharacter(by: charcterId)
        wait(for: [expectation], timeout: 0.1)
    }

    private func createCharacterDetailViewModel(controller: BaseCharacterDetailViewController,
                                                client: BaseCharacterClient) -> CharacterDetailViewModel {
        CharacterDetailViewModel(controller: controller, client: client)
    }
}
