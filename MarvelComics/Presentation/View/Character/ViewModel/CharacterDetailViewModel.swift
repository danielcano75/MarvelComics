//
//  CharacterDetailViewModel.swift
//  MarvelComics
//
//  Created by Daniel Cano Arbelaez on 8/03/22.
//

import UIKit
import Combine

class CharacterDetailViewModel: BaseCharacterDetailViewModel {
    var state: ViewState = .loading {
        didSet {
            controller.did(change: state)
        }
    }
    var character: CharacterModel
    var copyright: String = ""
    var cancellables = Set<AnyCancellable>()
    
    private let controller: BaseCharacterDetailViewController
    private let client: BaseCharacterClient
    
    init(controller: BaseCharacterDetailViewController,
         client: BaseCharacterClient) {
        self.character = CharacterModel.mock(filename: FileNameType.character.value)
        self.controller = controller
        self.client = client
    }
    
    static func make(controller: BaseCharacterDetailViewController,
                     client: BaseCharacterClient = CharacterClient.make()) -> CharacterDetailViewModel {
        return CharacterDetailViewModel(controller: controller,
                                        client: client)
    }
    
    func fetchCharacter(by id: Int) {
        changeToLoading()
        client.character(.characters, by: id)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] result in
                if case .failure(let error) = result {
                    print(error.localizedDescription)
                    self?.controller.message(error: error.localizedDescription)
                    self?.state = .error
                }
        } receiveValue: { [weak self] response in
            guard let character = response.data.results.first else {
                self?.controller.message(error: "TODO: NOT FOUND CHARACTER BY THIS ID!!!")
                self?.state = .error
                return
            }
            self?.character = character
            self?.copyright = response.copyright
            self?.state = .loaded
        }
        .store(in: &cancellables)
    }
    
    private func changeToLoading() {
        character = CharacterModel.mock(filename: FileNameType.character.value)
        state = .loading
    }
}
