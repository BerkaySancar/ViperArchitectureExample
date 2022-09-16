//
//  ServiceEndpointContracts.swift
//  RickAndMorty
//
//  Created by Berkay Sancar on 16.09.2022.
//

protocol ServiceEndpointProtocols {
    
    var baseURLString: String { get }
    var path: String { get }
    var httpMethod: String { get }
}

extension ServiceEndpointProtocols {
    var url: String {
        return baseURLString + path
    }
}
