//
//  RickAndMortyService.swift
//  RickAndMorty
//
//  Created by Berkay Sancar on 12.09.2022.
//

import Alamofire

protocol RickAndMortyServiceProtocol {
    func fetchCharacters(completion: @escaping ((Result<[Char]?, AFError>) -> Void))
}

final class RickAndMortyService: RickAndMortyServiceProtocol {
    
    func fetchCharacters(completion: @escaping ((Result<[Char]?, AFError>) -> Void)) {
        
        let url = RickAndMortyServiceEndpoint.getCharacters.url
        let method = HTTPMethod(rawValue: RickAndMortyServiceEndpoint.getCharacters.httpMethod)
        
        NetworkManager.shared.sendRequest(type: BaseResponse.self,
                                          url: url,
                                          method: method) { response in
            
            switch response {
            case .success(let data):
                completion(.success(data.results))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
