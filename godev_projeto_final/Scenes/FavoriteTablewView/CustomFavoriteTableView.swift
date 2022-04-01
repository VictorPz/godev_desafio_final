//
//  FavoriteTableView.swift
//  godev_projeto_final
//
//  Created by Victor Pizetta on 29/03/22.
//

import UIKit

class CustomFavoriteTableView: UIView {
    
    public var coreDataRepos: [CoreDataRepo] = [] {
        didSet {
            DispatchQueue.main.async {
                self.favoriteTableView.reloadData()
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

}

extension CustomFavoriteTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coreDataRepos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else {return UITableViewCell()}
        
        let repo = coreDataRepos[indexPath.row]
        cell.updateFavoriteView(repoTitle: repo.name, repoDescription: repo.details, image: UIImage(data: repo.image)!)
        return cell
    }
}

extension CustomFavoriteTableView: ViewCodable {
    func buildHierarchy() {
        
        addSubview(favoriteTableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate ([
            favoriteTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            favoriteTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            favoriteTableView.topAnchor.constraint(equalTo: topAnchor),
            favoriteTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
