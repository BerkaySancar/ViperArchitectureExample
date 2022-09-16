//
//  ServiceEndpoints.swift
//  RickAndMorty
//
//  Created by Berkay Sancar on 12.09.2022.
//

enum RickAndMortyServiceEndpoint: ServiceEndpointProtocols {
    
    case getCharacters
    
    var httpMethod: String {
        switch self {
        case .getCharacters:
            return "GET"
        }
    }
    
    var baseURLString: String {
        switch self {
        case .getCharacters:
            return "https://rickandmortyapi.com/api"
        }
    }
    
    var path: String {
        switch self {
        case .getCharacters:
            return "/character"
        }
    }
}
