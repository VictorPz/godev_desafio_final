//
//  TeamViewController.swift
//  godev_projeto_final
//
//  Created by Victor Pizetta on 23/03/22.
//

import UIKit

class TeamViewController: UIViewController {
    
    let tableview = CustomTeamTableView()
    let teamInfo: [Team] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
    }
    
    override func viewDidLoad() {
    }
    
    override func loadView() {
        self.view = self.tableview
        tableview.tableview.delegate = self
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

extension TeamViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailTeamViewController = DetailTeamViewController()
        let team = Team.populateData()
        let elements = team[indexPath.row]
        detailTeamViewController.detailTeamView.setupInfo(infoRepo: elements)
        detailTeamViewController.title = elements.name
        navigationController?.pushViewController(detailTeamViewController, animated: true)
    }
}

