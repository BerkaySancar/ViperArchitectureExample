//
//  CharacterDetailViewController.swift
//  RickAndMorty
//
//  Created by Berkay Sancar on 13.09.2022.
//

import Kingfisher
import UIKit

class CharacterDetailViewController: UIViewController, CharacterDetailViewProtocol {
   
    private lazy var charImageView: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private lazy var charName: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var charStatus: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var charGender: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var charSpecies: UILabel = {
        let label = UILabel()
        return label
    }()
    
    var presenter: CharacterDetailPresenterProtocol!
    
// MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        presenter.load()
    }
    
// MARK: - Ui Configure
    private func configure() {
        
        title = "Detail"
        view.backgroundColor = .systemBackground
        view.addSubview(charName)
        view.addSubview(charImageView)
        view.addSubview(charStatus)
        view.addSubview(charSpecies)
        view.addSubview(charGender)
        
        charImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.left.right.equalToSuperview()
            make.height.equalTo(300)
        }
        
        charName.snp.makeConstraints { make in
            make.top.equalTo(charImageView.snp.bottom).offset(50)
            make.centerX.equalTo(charImageView)
        }
        charGender.snp.makeConstraints { make in
            make.top.equalTo(charName.snp.bottom).offset(10)
            make.left.equalTo(charName)
        }
        charSpecies.snp.makeConstraints { make in
            make.top.equalTo(charGender.snp.bottom).offset(10)
            make.left.equalTo(charGender)
        }
        charStatus.snp.makeConstraints { make in
            make.top.equalTo(charSpecies.snp.bottom).offset(10)
            make.left.equalTo(charSpecies)
        }
    }
    
     func showDetail(_ character: Char) {
        guard let url = URL(string: character.image ?? "") else { return }
        charImageView.kf.setImage(with: url)
        charName.text = "Name: \(character.name ?? "")"
        charGender.text = "Gender: \(character.gender ?? "")"
        charSpecies.text = "Species: \(character.species ?? "")"
        charStatus.text = "Status: \(character.status ?? "")"
    }
}
