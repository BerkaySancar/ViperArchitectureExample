//
//  CharacterListContracts.swift
//  RickAndMorty
//
//  Created by Berkay Sancar on 12.09.2022.
//

import Foundation

// MARK: - Interactor

protocol CharacterListInteracterProtocol: AnyObject {
    var delegate: CharacterListInteractorDelegate? { get set }
    
    func load()
    func selectCharacter(index: Int)
}

enum CharacterListInteractorOutput {
    case setLoading(Bool)
    case showCharacterList([Char])
    case showCharacterDetail(Char)
}

protocol CharacterListInteractorDelegate: AnyObject {
    func handleOutput(_ output: CharacterListInteractorOutput)
}

// MARK: - Presenter

protocol CharacterListPresenterProtocol: AnyObject {
    func load()
    func selectCharacter(index: Int)
}

enum CharacterListPresenterOutput {
    case setLoading(Bool)
    case showCharacters([Char])
}

// MARK: - View

protocol CharacterListViewProtocol: AnyObject {
    func handleOutput(_ output: CharacterListPresenterOutput)
}

// MARK: - Router

enum CharacterListRoute {
    case detail(Char)
}

protocol CharacterListRouterProtocol: AnyObject {
    func navigate(route: CharacterListRoute)
}
