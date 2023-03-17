//
//  APIModel.swift
//  RickandMorty
//
//  Created by Gustavo da Silva Braghin on 17/03/23.
//

import Foundation

struct APIModel: Decodable {
    var info: Info
    var results: [CharacterModel]
    
    struct Info: Decodable {
        var count: Int
        var pages: Int
        var next: String?
        var prev: String?
    }
}
