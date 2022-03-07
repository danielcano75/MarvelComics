//
//  CharactersViewModel.swift
//  MarvelComics
//
//  Created by Daniel Cano Arbelaez on 4/03/22.
//

import Foundation
import Combine

class CharactersViewModel: BaseCharactersViewModel {
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
    
    func fetchCharacters() {
        client.characters(.characters)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] result in
                if case .failure(let error) = result {
                    print(error.localizedDescription)
                    self?.characters = []
                    self?.controller.refreshData()
                    self?.controller.message(error: error.localizedDescription)
                }
        } receiveValue: { [weak self] response in
            self?.characters = response.data.results
            self?.controller.refreshData()
        }
        .store(in: &cancellables)
    }
}
