//
//  FavoriteViewController.swift
//  godev_projeto_final
//
//  Created by Victor Pizetta on 23/03/22.
//

import UIKit

class FavoriteViewController: UIViewController {
    
    let favoriteTableView = CustomFavoriteTableView()
    private var infoRepo: [Repo] = []
    
    private func delegates() {
        favoriteTableView.favoriteTableView.delegate = self
    }
    
    override func loadView() {
        self.view = self.favoriteTableView
        delegates()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        favoriteTableView.initCoreDataRepos()
        setupNavBar()
    }
    
    override func viewDidLoad() {
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
    
    
}

extension FavoriteViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        infoRepo = self.favoriteTableView.coreDataRepos
        let detailGitRepositoryViewController = DetailGitRepositoryViewController()
        detailGitRepositoryViewController.infoRepo = infoRepo[indexPath.row]
        navigationController?.pushViewController(detailGitRepositoryViewController, animated: true)
    }
    
}
