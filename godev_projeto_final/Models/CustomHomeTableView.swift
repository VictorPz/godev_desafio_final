//
//  CustomTableView.swift
//  godev_projeto_final
//
//  Created by Victor Pizetta on 23/03/22.
//

import UIKit

class CustomHomeTableView: UIView {
    
    private var gitHubRepo: [GitHubRepo] = []
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    init() {
        super.init(frame: .zero)
        tableView.reloadData()
        tableView.showsVerticalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        
        //Sumir com o separador da celula - Rafael
        tableView.separatorColor = UIColor.clear
        dataGit()
        setupView()
        
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Dados mocados - Rafael
    private func dataGit() {
        gitHubRepo = [
            GitHubRepo(id: 50447720, node_id: "MDEwOlJlcG9zaXRvcnk1MDQ0NzcyMA==", name: "Swift-algorithm-club", fullName: "aywenderlich/swift-algorithm-club", html_url: "https://github.com/raywenderlich/swift-algorithm-club", description: "Algorithms and data structures in Swift, with explanations!", watchers_count: 26101, created_at: "2016-01-26T17:56:12Z", owner: Owner(login: "raywenderlich", id: 4722515, node_id: "MDEyOk9yZ2FuaXphdGlvbjQ3MjI1MTU=", avatar_url: "https://avatars.githubusercontent.com/u/4722515?v=4"), license: License(name: "MIT License")),
            GitHubRepo(id: 50447720, node_id: "MDEwOlJlcG9zaXRvcnk1MDQ0NzcyMA==", name: "Swift-algorithm-club", fullName: "aywenderlich/swift-algorithm-club", html_url: "https://github.com/raywenderlich/swift-algorithm-club", description: "Algorithms and data structures in Swift, with explanations!", watchers_count: 26101, created_at: "2016-01-26T17:56:12Z", owner: Owner(login: "raywenderlich", id: 4722515, node_id: "MDEyOk9yZ2FuaXphdGlvbjQ3MjI1MTU=", avatar_url: "https://avatars.githubusercontent.com/u/4722515?v=4"), license: License(name: "MIT License"))
        ]
    }
}

extension CustomHomeTableView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gitHubRepo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier) as? CustomTableViewCell else {return UITableViewCell()}
        let repo = gitHubRepo[indexPath.row]
        cell.updateView(repo: repo)
        return cell
    }
}

extension CustomHomeTableView: ViewCodable {
    
    func buildHierarchy() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate ([
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}


