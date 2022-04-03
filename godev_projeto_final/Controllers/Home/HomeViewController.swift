//
//  HomeViewController.swift
//  godev_projeto_final
//
//  Created by Victor Pizetta on 23/03/22.
//

import UIKit

class HomeViewController: UIViewController, UINavigationControllerDelegate, UISearchControllerDelegate {
    
    private var orderList: Bool = true
    private var infoRepo: [Repo] = []
    
    let tableView = CustomHomeTableView()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func loadView() {
        self.view = self.tableView
        delegates()
        tableView.dataGit()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Voltar", style: .plain, target: nil, action: nil)
        navigationControllerSetup()
        let repo = ManagedObjectContext.shared.getRepoData()
        
        print(repo)
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
    
}

extension HomeViewController: UISearchResultsUpdating, UISearchBarDelegate {
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        if let newSearch = searchBar.text, !newSearch.isEmpty {
            tableView.dataGit(search: newSearch)
        } else {
            tableView.dataGit()
        }
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        infoRepo = self.tableView.gitHubRepo
        let detailGitRepositoryViewController = DetailGitRepositoryViewController()
        detailGitRepositoryViewController.infoRepo = infoRepo[indexPath.row]
        navigationController?.pushViewController(detailGitRepositoryViewController, animated: true)
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        tableView.dataGit()
    }
}
