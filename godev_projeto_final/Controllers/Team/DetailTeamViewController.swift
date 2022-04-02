//
//  DetailTeamViewController.swift
//  godev_projeto_final
//
//  Created by Victor Pizetta on 01/04/22.
//

import UIKit

class DetailTeamViewController: UIViewController {
    
    var teamDetailView = TeamDetailView()
    
    override func loadView() {
        super.loadView()
        self.view = teamDetailView
    }
    
    override func viewDidLoad() {
        
    }
    
}
