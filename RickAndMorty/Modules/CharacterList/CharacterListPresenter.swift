//
//  CharacterListPresenter.swift
//  RickAndMorty
//
//  Created by Berkay Sancar on 12.09.2022.
//

import Foundation

final class CharacterListPresenter: CharacterListPresenterProtocol {
    
    private unowned let view: CharacterListViewProtocol
    private let interactor: CharacterListInteracterProtocol
    private let router: CharacterListRouterProtocol
    
    init(view: CharacterListViewProtocol,
         interactor: CharacterListInteracterProtocol,
         router: CharacterListRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
        
        self.interactor.delegate = self
    }
    
    func load() {
        
        interactor.load()
    }
    
    func selectCharacter(index: Int) {
        
        interactor.selectCharacter(index: index)
    }
}

extension CharacterListPresenter: CharacterListInteractorDelegate {
    
    func handleOutput(_ output: CharacterListInteractorOutput) {
        
        switch output {
        case .setLoading(let isLoading):
            view.handleOutput(.setLoading(isLoading))
            
        case .showCharacterList(let chars):
            view.handleOutput(.showCharacters(chars))
            
        case .showCharacterDetail(let char):
            router.navigate(route: .detail(char))
        }
    }
}
