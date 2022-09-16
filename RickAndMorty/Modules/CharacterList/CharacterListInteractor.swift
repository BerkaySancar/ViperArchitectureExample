//
//  CharacterListInteractor.swift
//  RickAndMorty
//
//  Created by Berkay Sancar on 12.09.2022.
//

import Foundation

final class CharacterListInteractor: CharacterListInteracterProtocol {
    
    weak var delegate: CharacterListInteractorDelegate?
    
    private let service: RickAndMortyServiceProtocol
    
    private var chars: [Char] = []
    
    init(service: RickAndMortyServiceProtocol) {
        self.service = service
    }
    
    func load() {
        
        delegate?.handleOutput(.setLoading(true))
        
        service.fetchCharacters { [weak self] results in
            guard let strongSelf = self else { return }
            strongSelf.delegate?.handleOutput(.setLoading(false))
            
            switch results {
            case .success(let data):
                strongSelf.chars = data ?? []
                strongSelf.delegate?.handleOutput(.showCharacterList(data ?? []))
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func selectCharacter(index: Int) {
        let char = chars[index]
        delegate?.handleOutput(.showCharacterDetail(char))
    }
}
