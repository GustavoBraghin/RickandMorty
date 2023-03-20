//
//  CharacterViewViewModel.swift
//  RickandMorty
//
//  Created by Gustavo da Silva Braghin on 17/03/23.
//

import Foundation

final class CharacterViewViewModel {
    private let apiRequest = APIRequest()
    var nextUrl: String?
    var characters: [CharacterModel]
    
    init() {
        self.characters = []
        self.nextUrl = apiRequest.baseUrl
        getAllCharacters()
    }
    
    func getAllCharacters() {
        apiRequest.getAllCharacters(urlString: nextUrl) { [weak self] result in
            switch result {
            case .success(let model):
                model.results.forEach { character in
                    self?.characters.append(character)
                }
                self?.nextUrl = model.info.next
                print("API Success")
                print(self?.nextUrl)
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
