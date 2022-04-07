//
//  TeamViewController.swift
//  godev_projeto_final
//
//  Created by Victor Pizetta on 23/03/22.
//

import UIKit

final class TeamViewController: UIViewController {
    
    let tableview = CustomTeamTableView()
    let teamInfo: [Team] = []
    
    //MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
    }
    
    override func viewDidLoad() {
    }
    
    override func loadView() {
        self.view = self.tableview
        tableview.tableView.delegate = self
    }
    
    //MARK: - Methods
    
    private func setupNavBar() {
        let appearance = UINavigationBarAppearance()

        appearance.backgroundColor = .defaultBackgroundColor
        appearance.titleTextAttributes = [.foregroundColor: UIColor.defaultNavControllerTitleColor]

        navigationController?.navigationBar.tintColor = .defaultTintColor
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
    }
}

//MARK: - Extensions

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

