//
//  CharacterListCellTableViewCell.swift
//  RickAndMorty
//
//  Created by Berkay Sancar on 12.09.2022.
//

import Kingfisher
import UIKit

class CharacterListCellTableViewCell: UITableViewCell {
    
    static let identifier = "CharacterListCellTableViewCell"
    
    private lazy var charName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.bold)
        return label
    }()
    
    private lazy var charStatus: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.semibold)
        return label
    }()
    
    private lazy var charImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        contentView.addSubview(charName)
        contentView.addSubview(charImage)
        contentView.addSubview(charStatus)
        charImage.clipsToBounds = true
        charImage.layer.cornerRadius = 30
        
        charImage.snp.makeConstraints { make in
            make.height.equalTo(200)
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().inset(20)
        }
        charName.snp.makeConstraints { make in
            make.top.equalTo(charImage.snp.bottom).offset(10)
            make.centerX.equalTo(charImage.snp.centerX)
        }
        charStatus.snp.makeConstraints { make in
            make.top.equalTo(charName.snp.bottom).offset(5)
            make.centerX.equalTo(charName)
        }
    }
    
    func design(name: String, status: String, imageURL: String) {
        
        let url = URL(string: imageURL)
        charImage.kf.setImage(with: url)
        charName.text = name
        charStatus.text = status
        
        switch status {
        case "Alive":
            charStatus.textColor = .systemGreen
            
        case "Dead":
            charStatus.textColor = .systemRed
            
        default:
            charStatus.textColor = .systemGray
        }
    }
}
