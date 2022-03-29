//
//  FavoriteTableView.swift
//  godev_projeto_final
//
//  Created by Victor Pizetta on 29/03/22.
//

import UIKit

class CustomFavoriteTableView: UIView {
    
    lazy var favoriteTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(FavoriteCustomTableViewCell.self, forCellReuseIdentifier: FavoriteCustomTableViewCell.identifier)
        tableView.dataSource = self
        return tableView
    }()
    
    init() {
        super.init(frame: .zero)
        favoriteTableView.reloadData()
        favoriteTableView.showsVerticalScrollIndicator = false
        
        favoriteTableView.separatorColor = UIColor.clear
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomFavoriteTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteCustomTableViewCell.identifier, for: indexPath) as? FavoriteCustomTableViewCell else {return UITableViewCell()}
        cell.updateView()
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
