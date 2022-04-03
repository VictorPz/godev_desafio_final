//
//  ViewController.swift
//  godev_projeto_final
//
//  Created by Victor Pizetta on 21/03/22.
//

import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        tabBar.backgroundColor = .systemBackground
        tabBar.tintColor = .label
        setupViewControllers()
    }
    
    private func tabBarNavController(for rootViewController: UIViewController, title: String,
                                     navigationTitle: String,
                                     image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.navigationBar.barTintColor = .systemBackground
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        rootViewController.navigationItem.title = navigationTitle
        return navController
    }
    
    func setupViewControllers() {
          viewControllers = [
              tabBarNavController(for: HomeViewController(), title: "Home", navigationTitle: "List", image: UIImage(systemName: "house")!),
              tabBarNavController(for: FavoriteViewController(), title: "Favoritos", navigationTitle: "Favoritos", image: UIImage(systemName: "star")!),
              tabBarNavController(for: TeamViewController(), title: "Time", navigationTitle: "Time de Desenvolvedores", image: UIImage(systemName: "person.3")!)
          ]
      }
}
