//
//  CharacterDetailPresenter.swift
//  RickAndMorty
//
//  Created by Berkay Sancar on 13.09.2022.
//

import Foundation

final class CharacterDetailPresenter: CharacterDetailPresenterProtocol {
    
    private unowned let view: CharacterDetailViewProtocol
    private let char: Char
    
    init(view: CharacterDetailViewProtocol, char: Char) {
        self.view = view
        self.char = char
    }
    
    func load() {
        view.showDetail(char)
    }
}
