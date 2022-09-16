//
//  CharacterDetailContracts.swift
//  RickAndMorty
//
//  Created by Berkay Sancar on 13.09.2022.
//

import Foundation

// MARK: - View
protocol CharacterDetailViewProtocol: AnyObject {
    func showDetail(_ character: Char)
}

// MARK: - Presenter
protocol CharacterDetailPresenterProtocol {
    func load()
}
