//
//  CharacterViewViewModel.swift
//  RickandMorty
//
//  Created by Gustavo da Silva Braghin on 17/03/23.
//

import Foundation

final class CharacterViewViewModel {
    private let apiRequest = APIRequest()
    var characters: [CharacterModel]
    
    init() {
        self.characters = []
        APIRequest().getAllCharacters { [weak self] result in
            switch result {
            case .success(let model):
                print(model.results)
                self?.characters = model.results
//                    print("CC: ----------- :: \(self?.characters.count)")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
}
