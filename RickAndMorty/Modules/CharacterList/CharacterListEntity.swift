//
//  HomeEntity.swift
//  RickAndMorty
//
//  Created by Berkay Sancar on 12.09.2022.
//

struct BaseResponse: Codable {
    
    let results: [Char]?
}

struct Char: Codable {
    
    let name: String?
    let status: String?
    let gender: String?
    let species: String?
    let image: String?
}
