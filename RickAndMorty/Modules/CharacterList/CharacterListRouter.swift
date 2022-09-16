//
//  CharacterListRouter.swift
//  RickAndMorty
//
//  Created by Berkay Sancar on 12.09.2022.
//

import UIKit

final class CharacterListRouter: CharacterListRouterProtocol {
    
    unowned let view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func navigate(route: CharacterListRoute) {
        
        switch route {
        case .detail(let char):
            let detailView = CharacterDetailBuilder.make(char: char)
            view.show(detailView, sender: nil)
        }
    }
}
