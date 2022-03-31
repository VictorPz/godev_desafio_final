//
//  TeamViewController.swift
//  godev_projeto_final
//
//  Created by Victor Pizetta on 23/03/22.
//

import UIKit

class TeamViewController: UIViewController {
    
    let tableview = CustomTeamTableView()
    
    override func viewDidLoad() {
        view.backgroundColor = .red
    }
    
    override func loadView() {
        self.view = self.tableview
    }
}

