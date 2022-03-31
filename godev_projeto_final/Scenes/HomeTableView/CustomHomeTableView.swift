//
//  CustomTableView.swift
//  godev_projeto_final
//
//  Created by Victor Pizetta on 23/03/22.
//

import UIKit

class CustomHomeTableView: UIView {

    public var gitHubRepo: [GitHubRepo] = [] {
        didSet {
            self.verifyListCount()
        }
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        tableView.dataSource = self
        //tableView.delegate = self
        return tableView
    }()
    
    private lazy var loading: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.hidesWhenStopped = true
        return view
    }()
    
    private lazy var emptyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nenhum repositório encontrado!"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .systemGray
        label.numberOfLines = 0
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        tableView.reloadData()
        tableView.showsVerticalScrollIndicator = false
        
        //Sumir com o separador da celula - Rafael
        tableView.separatorColor = UIColor.clear
        //dataGit()
        setupView()
        
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Dados mocados - Rafael
//    private func dataGit() {
//        gitHubRepo = [
//            GitHubRepo(id: 50447720, node_id: "MDEwOlJlcG9zaXRvcnk1MDQ0NzcyMA==", name: "Swift-algorithm-club", fullName: "aywenderlich/swift-algorithm-club", html_url: "https://github.com/raywenderlich/swift-algorithm-club", description: "Algorithms and data structures in Swift, with explanations!", watchers_count: 26101, created_at: "2016-01-26T17:56:12Z", owner: Owner(login: "raywenderlich", id: 4722515, node_id: "MDEyOk9yZ2FuaXphdGlvbjQ3MjI1MTU=", avatar_url: "https://avatars.githubusercontent.com/u/4722515?v=4"), license: License(name: "MIT License")),
//            GitHubRepo(id: 50447720, node_id: "MDEwOlJlcG9zaXRvcnk1MDQ0NzcyMA==", name: "Swift-algorithm-club", fullName: "aywenderlich/swift-algorithm-club", html_url: "https://github.com/raywenderlich/swift-algorithm-club", description: "Algorithms and data structures in Swift, with explanations!", watchers_count: 26101, created_at: "2016-01-26T17:56:12Z", owner: Owner(login: "raywenderlich", id: 4722515, node_id: "MDEyOk9yZ2FuaXphdGlvbjQ3MjI1MTU=", avatar_url: "https://avatars.githubusercontent.com/u/4722515?v=4"), license: License(name: "MIT License"))
//        ]
//    }
}

extension CustomHomeTableView: UITableViewDataSource {
    func dataGit(search: String = "swift", orderBy: Bool = true) {
        var language = search
        if language.isEmpty {
            language = "swift"
        }
        startLoading()
        githubApiService.shared.fetchList(for: search, orderBy: orderBy) { result in
            switch result {
            case .success(let results):
                self.gitHubRepo = results
                self.onSuccessRequest()
            case .failure(let error):
                print("error: \(error)")
            }
        }
    }
    
    func orderBy() {
        self.gitHubRepo.reverse()
        self.tableView.reloadData()
    }
    
    private func onSuccessRequest() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.stopLoading()
        }
    }
    
    private func onErrorRequest() {
        DispatchQueue.main.async {
            self.stopLoading()
        }
    }
    
    private func startLoading() {
        self.tableView.isHidden = true
        self.loading.startAnimating()
    }
    
    private func stopLoading() {
        self.tableView.isHidden = false
        self.loading.stopAnimating()
    }
    
    private func verifyListCount() {
        DispatchQueue.main.async { [self] in
            emptyLabel.isHidden = gitHubRepo.count != 0
        }
    }
}

extension CustomHomeTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 93
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gitHubRepo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier) as? CustomTableViewCell else { return UITableViewCell() }
        let repo = gitHubRepo[indexPath.row]
        cell.updateView(repo: repo)
        return cell
    }
}

extension CustomHomeTableView: ViewCodable {
    
    func buildHierarchy() {
        addSubview(tableView)
        addSubview(loading)
        addSubview(emptyLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate ([
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            loading.centerYAnchor.constraint(equalTo: centerYAnchor),
            loading.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            emptyLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            emptyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            emptyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        ])
    }
}


