//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Berkay Sancar on 12.09.2022.
//

import SnapKit
import UIKit

class CharacterListViewController: UIViewController, CharacterListViewProtocol {
    
    private lazy var charListTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CharacterListCellTableViewCell.self,
                           forCellReuseIdentifier: CharacterListCellTableViewCell.identifier)
        return tableView
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        return indicator
    }()
    
    private var chars: [Char] = []
    
    var presenter: CharacterListPresenterProtocol! 

// MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        presenter.load()
    }
    
// MARK: - Ui Configure
    private func configure() {
        
        title = "Characters"
        view.addSubview(charListTableView)
        view.addSubview(activityIndicator)
        view.backgroundColor = .systemBackground
        charListTableView.delegate = self
        charListTableView.dataSource = self
        
        charListTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.right.bottom.equalToSuperview()
        }
        
        activityIndicator.snp.makeConstraints { make in
            make.right.equalTo(view.snp.right).inset(10)
            make.bottom.equalTo(charListTableView.snp.top).offset(-12)
        }
    }
 // MARK: - Handle Output
    func handleOutput(_ output: CharacterListPresenterOutput) {
        
        switch output {
        case .setLoading(let isLoading):
            if isLoading {
                activityIndicator.startAnimating()
            } else {
                activityIndicator.stopAnimating()
            }
            
        case .showCharacters(let chars):
            self.chars = chars
            self.charListTableView.reloadData()
        }
    }
}
// MARK: - TableView Delegate & DataSource
extension CharacterListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterListCellTableViewCell.identifier,
                                                       for: indexPath) as? CharacterListCellTableViewCell
        else { return UITableViewCell() }
        
        let char = chars[indexPath.row]
        cell.design(name: char.name ?? "", status: char.status ?? "", imageURL: char.image ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 265
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        presenter.selectCharacter(index: indexPath.row)
    }
}
