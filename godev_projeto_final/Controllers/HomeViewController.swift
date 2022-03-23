//
//  HomeViewController.swift
//  godev_projeto_final
//
//  Created by Victor Pizetta on 23/03/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    let tableView = CustomHomeTableView()
    
    override func viewDidLoad() {
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
    }
    
}
