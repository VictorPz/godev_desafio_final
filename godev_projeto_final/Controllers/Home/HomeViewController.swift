//
//  HomeViewController.swift
//  godev_projeto_final
//
//  Created by Victor Pizetta on 23/03/22.
//

import UIKit

final class HomeViewController: UIViewController, UINavigationControllerDelegate, UISearchControllerDelegate, CustomHomeTableViewDelegate {
    
    //MARK: - Alerts
    
    func showAlert(errorType: responseError) {
        var alert = UIAlertController()
        
        switch errorType {
        case .urlInvalid:
            alert = UIAlertController(title: "URL Inválida", message: "Não foi possível indentificar a url fornecida.",
                                      preferredStyle: .alert)
        case .noProcessData:
            alert = UIAlertController(title: "Processo Indisponível", message: "Não foi possível concluir a formatação de dados",
                                      preferredStyle: .alert)
        case .noDataAvailable:
            alert = UIAlertController(title: "Dados Indisponíveis", message: "Não foi possível encontrar dados através da requisição.",
                                      preferredStyle: .alert)
        }
    
        let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
    
    private var orderList: Bool = true
    private var infoRepo: [Repo] = []
    
    let tableView = CustomHomeTableView()
    let searchController = UISearchController(searchResultsController: nil)
    
    //MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
    }
    
    override func loadView() {
        self.view = self.tableView
        tableView.delegate = self
        delegates()
        tableView.dataGit()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Voltar", style: .plain, target: nil, action: nil)
        navigationControllerSetup()
    }
    
    //MARK: - Methods
    
    private func delegates() {
        tableView.tableView.delegate = self
    }
    
    private func navigationControllerSetup() {
        navigationItem.searchController = searchController
        self.definesPresentationContext = true
        navigationItem.hidesSearchBarWhenScrolling = true
        self.searchBarControllerSetup()
    }
    
    private func searchBarControllerSetup() {
        searchController.delegate = self
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Pesquisa"
        definesPresentationContext = true
        searchController.loadViewIfNeeded()
        
        searchController.searchBar.delegate = self
        
        searchController.searchBar.sizeToFit()
        searchController.searchBar.searchTextField.tintColor = .defaultTintColor
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.up.arrow.down"), style: .plain, target: self, action: #selector(orderByDescAndAsc))
        
    }
    
    private func setupNavBar() {
        let appearance = UINavigationBarAppearance()
        
        appearance.backgroundColor = .defaultBackgroundColor
        appearance.titleTextAttributes = [.foregroundColor: UIColor.defaultNavControllerTitleColor]
        
        navigationController?.navigationBar.tintColor = .defaultTintColor
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
    }
    
    @objc private func orderByDescAndAsc() {
        tableView.orderBy()
        
    }
    
}

//MARK: - Extensions

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
