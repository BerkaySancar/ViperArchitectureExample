//
//  CharacterListBuilder.swift
//  RickAndMorty
//
//  Created by Berkay Sancar on 12.09.2022.
//

import Foundation

final class CharacterListBuilder {
    
    static func make() -> CharacterListViewController {
        
        let viewController = CharacterListViewController()
        let router = CharacterListRouter(view: viewController)
        let interactor = CharacterListInteractor(service: RickAndMortyService())
        let presenter = CharacterListPresenter(view: viewController,
                                               interactor: interactor,
                                               router: router)
        
        viewController.presenter = presenter
        
        return viewController
    }
}
