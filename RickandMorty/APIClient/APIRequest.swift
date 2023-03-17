//
//  APIRequest.swift
//  RickandMorty
//
//  Created by Gustavo da Silva Braghin on 17/03/23.
//

import Foundation

enum ServiceError: Error {
    case invalidURL
    case network(Error?)
    case invalidFormat
}

final class APIRequest {
    private let baseUrl = "https://rickandmortyapi.com/api"
    
    func getAllCharacters(completion: @escaping(Result<APIModel, ServiceError>) -> Void) {
        let path = "/character"
        
        guard let url = URL(string: baseUrl + path) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completion(.failure(.network(error)))
                return
            }
            
            guard let result = try? JSONDecoder().decode(APIModel.self, from: data) else {
                completion(.failure(.invalidFormat))
                return
            }
            completion(.success(result))
        }
        task.resume()
    }
}
