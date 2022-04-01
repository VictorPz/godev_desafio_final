//
//  FavoriteViewController.swift
//  godev_projeto_final
//
//  Created by Victor Pizetta on 23/03/22.
//

import UIKit

class FavoriteViewController: UIViewController {
    
    let favoriteTableView = CustomFavoriteTableView()
    
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
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .blue
    }
}

extension FavoriteViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(FavoriteDetail(), animated: true)
    }
    
}
