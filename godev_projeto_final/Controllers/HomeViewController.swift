//
//  HomeViewController.swift
//  godev_projeto_final
//
//  Created by Victor Pizetta on 23/03/22.
//

import UIKit

class HomeViewController: UIViewController, UINavigationControllerDelegate, UISearchControllerDelegate {
    
    private var searchText: String = "swift" {
        didSet {
            updateData()
        }
    }
    
    let tableView = CustomHomeTableView()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func loadView() {
        self.view = self.tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationControllerSetup()
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
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchText = "swift"
    }
}
