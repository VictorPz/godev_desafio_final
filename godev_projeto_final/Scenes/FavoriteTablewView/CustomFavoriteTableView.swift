//
//  FavoriteTableView.swift
//  godev_projeto_final
//
//  Created by Victor Pizetta on 29/03/22.
//

import UIKit

class CustomFavoriteTableView: UIView {
    
    public var coreDataRepos: [Repo] = [] {
        didSet {
            DispatchQueue.main.async {
                self.favoriteTableView.reloadData()
                self.verifyListCount()
            }
        }
    }
    
    lazy var favoriteTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        tableView.dataSource = self
        return tableView
    }()
    
    private lazy var emptyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Você não possui repositórios favoritados ainda!"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .systemGray
        label.numberOfLines = 0
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        favoriteTableView.reloadData()
        favoriteTableView.showsVerticalScrollIndicator = false
        
        favoriteTableView.separatorColor = UIColor.clear
        setupView()
        initCoreDataRepos()
    }
    
    public func initCoreDataRepos() {
        coreDataRepos = ManagedObjectContext.shared.getRepoData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func verifyListCount() {
        DispatchQueue.main.async { [self] in
            emptyLabel.isHidden = coreDataRepos.count != 0
        }
    }
    
}

extension CustomFavoriteTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coreDataRepos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else {return UITableViewCell()}
        
        let repo = coreDataRepos[indexPath.row]
        cell.updateFavoriteView(repoTitle: repo.name, repoDescription: repo.description ?? "No Description", image: UIImage(data: repo.owner.avatarImage!)!)
        return cell
    }
}

extension CustomFavoriteTableView: ViewCodable {
    func buildHierarchy() {
        
        addSubview(favoriteTableView)
        addSubview(emptyLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate ([
            favoriteTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            favoriteTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            favoriteTableView.topAnchor.constraint(equalTo: topAnchor),
            favoriteTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            emptyLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            emptyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            emptyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        ])
    }
}
