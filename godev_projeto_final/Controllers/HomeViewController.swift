//
//  HomeViewController.swift
//  godev_projeto_final
//
//  Created by Victor Pizetta on 23/03/22.
//

import UIKit

class HomeViewController: UIViewController, UINavigationControllerDelegate, UISearchControllerDelegate {
    
    private var orderList: Bool = true
    //private var infoRepo: [GitHubRepo] = []

    private var searchText: String = "swift" {
        didSet {
            updateData()
        }
    }
    
    let tableView = CustomHomeTableView()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func loadView() {
        self.view = self.tableView
        delegates()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        view.addSubview(tableView)
        

        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Voltar", style: .plain, target: nil, action: nil)
        navigationControllerSetup()
        
//        infoRepo = [
//            GitHubRepo(id: 50447720, node_id: "MDEwOlJlcG9zaXRvcnk1MDQ0NzcyMA==", name: "Swift-algorithm-club 01", fullName: "aywenderlich/swift-algorithm-club", html_url: "https://github.com/raywenderlich/swift-algorithm-club", description: "Algorithms and data structures in Swift, with explanations!", watchers_count: 26101, created_at: "2016-01-26T17:56:12Z", owner: Owner(login: "raywenderlich", id: 4722515, node_id: "MDEyOk9yZ2FuaXphdGlvbjQ3MjI1MTU=", avatar_url: "https://avatars.githubusercontent.com/u/4722515?v=4"), license: License(name: "MIT License")),
//            GitHubRepo(id: 50447720, node_id: "MDEwOlJlcG9zaXRvcnk1MDQ0NzcyMA==", name: "Swift-algorithm-club 02", fullName: "aywenderlich/swift-algorithm-club", html_url: "https://github.com/raywenderlich/swift-algorithm-club", description: "Algorithms and data structures in Swift, with explanations!", watchers_count: 26101, created_at: "2016-01-26T17:56:12Z", owner: Owner(login: "raywenderlich", id: 4722515, node_id: "MDEyOk9yZ2FuaXphdGlvbjQ3MjI1MTU=", avatar_url: "https://avatars.githubusercontent.com/u/4722515?v=4"), license: License(name: "MIT License"))
//        ]
    }
    
    private func delegates() {
        tableView.tableView.delegate = self
    }
    
    private func navigationControllerSetup() {
        navigationItem.searchController = searchController
        self.definesPresentationContext = true
        navigationItem.hidesSearchBarWhenScrolling = false
        self.searchBarControllerSetup()
    }
    
    private func searchBarControllerSetup() {
        searchController.delegate = self
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Pesquisa"
        definesPresentationContext = true
        searchController.loadViewIfNeeded()
        
        searchController.searchBar.delegate = self
        
        //Não consegui deixar a searchBar no tamanho 45 - verificar - Rafael
        searchController.searchBar.sizeToFit()
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.delegate = self
        
        //Configuration Button Order by
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.up.arrow.down"), style: .plain, target: self, action: #selector(orderByDescAndAsc))
        navigationController?.navigationBar.tintColor = .label
        
    }
    
    //Função para chamar a ordenação da lista
    @objc private func orderByDescAndAsc() {
        tableView.orderBy()

    }
    
    private func updateData() {
        tableView.dataGit(search: searchText)
    }
    
}

extension HomeViewController: UISearchResultsUpdating, UISearchBarDelegate {
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        if let newSearch = searchBar.text {
            searchText = newSearch
        }
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        print("list info \(String(describing: searchController.searchBar.text))")
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let detailGitRepositoryViewController = DetailGitRepositoryViewController()
//        detailGitRepositoryViewController.infoRepo = infoRepo[indexPath.row]
//        navigationController?.pushViewController(detailGitRepositoryViewController, animated: true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchText = "swift"
    }
}
