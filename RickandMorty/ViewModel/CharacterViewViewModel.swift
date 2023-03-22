//
//  CharacterViewViewModel.swift
//  RickandMorty
//
//  Created by Gustavo da Silva Braghin on 17/03/23.
//

import UIKit

final class CharacterViewViewModel {
    private let apiRequest = APIRequest()
    var nextUrl: String?
    var characters: [CharacterModel]
    var finishedFetching = false
    
    init() {
        self.nextUrl = apiRequest.baseUrl
        self.characters = []
    }
    
    func getAllCharacters(collectionView: UICollectionView) {
        apiRequest.getAllCharacters(urlString: nextUrl) { [weak self] result in
            switch result {
            case .success(let model):
                model.results.forEach { character in
                    self?.characters.append(character)
                }
                
                self?.nextUrl = model.info.next
                print("API Success")
                
                DispatchQueue.main.async {
                    collectionView.reloadData()
                    print("Reloaded collection view")
                }
                
                if self?.nextUrl != nil {
                    self?.getAllCharacters(collectionView: collectionView)
                } else {
                    self?.finishedFetching = true
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
