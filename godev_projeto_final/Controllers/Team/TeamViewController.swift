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
    
    override func viewDidLoad() {
    }
    
    override func loadView() {
        self.view = self.tableview
        tableview.tableview.delegate = self
    }
}

extension TeamViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailTeamViewController = DetailTeamViewController()
        let team = Team.populateData()
        let elements = team[indexPath.row]
        detailTeamViewController.teamDetailView.setupInfo(infoRepo: elements)
        navigationController?.pushViewController(detailTeamViewController, animated: true)
    }
}

