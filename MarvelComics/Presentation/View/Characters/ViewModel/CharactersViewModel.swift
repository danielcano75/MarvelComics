//
//  CharactersViewModel.swift
//  MarvelComics
//
//  Created by Daniel Cano Arbelaez on 4/03/22.
//

import Foundation
import Combine

class CharactersViewModel: BaseCharactersViewModel {
    var state: ViewState = .loading {
        didSet {
            controller.did(change: state)
        }
    }
    var characters: [CharacterModel] = []
    var cancellables = Set<AnyCancellable>()
    
    private let controller: BaseCharactersViewController
    private let client: BaseCharacterClient
    
    init(controller: BaseCharactersViewController,
         client: BaseCharacterClient) {
        self.controller = controller
        self.client = client
    }
    
    static func make(controller: BaseCharactersViewController,
                     client: BaseCharacterClient = CharacterClient.make()) -> CharactersViewModel {
        return CharactersViewModel(controller: controller,
                               client: client)
    }
    
    func fetchCharacters(offset: String?, name: String?) {
        let storeCharacters = self.characters
        cancellables.removeAll()
        changeToLoading(offset: offset)
        client.characters(.characters, offset: offset, name: name)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] result in
                if case .failure(let error) = result {
                    print(error.localizedDescription)
                    self?.characters = []
                    self?.state = .error(message: error.localizedDescription)
                }
        } receiveValue: { [weak self] response in
            if offset == nil {
                self?.characters = response.data.results
            } else {
                self?.characters = storeCharacters
                self?.characters.append(contentsOf: response.data.results)
            }
            self?.state = .loaded
        }
        .store(in: &cancellables)
    }
    
    private func changeToLoading(offset: String?) {
        if offset == nil {
            let response = APIResponseModel<CharacterModel>.mock(filename: FileNameType.characters.value)
            characters = response.data.results
            state = .loading
        }
    }
}
