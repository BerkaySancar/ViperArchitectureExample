//
//  CharacterDetailBuilder.swift
//  RickAndMorty
//
//  Created by Berkay Sancar on 13.09.2022.
//

import UIKit

final class CharacterDetailBuilder {
    
    static func make(char: Char) -> CharacterDetailViewController {
        
        let viewController = CharacterDetailViewController()
        let presenter = CharacterDetailPresenter(view: viewController, char: char)
        viewController.presenter = presenter
        return viewController
    }
}
