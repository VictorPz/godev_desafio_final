//
//  HomeViewController.swift
//  godev_projeto_final
//
//  Created by Victor Pizetta on 23/03/22.
//

import UIKit

class HomeViewController: UIViewController {
  
    let tableView = CustomHomeTableView()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func loadView() {
        self.navigationControllerSetup()
        self.view = self.tableView
    }
        
    override func viewDidLoad() {
        view.backgroundColor = .systemBackground
    }
    
    private func navigationControllerSetup() {
         self.navigationItem.searchController = searchController
         self.definesPresentationContext = true
         self.searchBarControllerSetup()
     }
     
     private func searchBarControllerSetup() {
         searchController.searchResultsUpdater = self
         searchController.searchBar.placeholder = "Pesquisa"
         //Não consegui deixar a searchBar no tamanho 45 - verificar - Rafael
         searchController.searchBar.frame.size.height = 45
         searchController.hidesNavigationBarDuringPresentation = false
         searchController.searchBar.delegate = self
     }
    
}

extension HomeViewController: UISearchResultsUpdating, UISearchBarDelegate {
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        print("list info \(String(describing: searchController.searchBar.text))")
    }
    
    
}
