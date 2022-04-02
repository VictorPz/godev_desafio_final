//
//  DetailTeamViewController.swift
//  godev_projeto_final
//
//  Created by Victor Pizetta on 01/04/22.
//

import UIKit
import SafariServices


class DetailTeamViewController: UIViewController {
    
    var teamDetailView = TeamDetailView()
    
    public func presents(view: UIViewController) {
        present(view, animated: true)
    }
    
    public func openLinkedin(url: String) {
        if let url = URL(string: url) {
            
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true
            
            let viewController = SFSafariViewController(url: url, configuration: config)
            viewController.delegate = self
            viewController.dismissButtonStyle = .close
            
            present(viewController, animated: true)
        }
    }
    
    
    override func loadView() {
        super.loadView()
        self.view = teamDetailView
    }
    
    override func viewDidLoad() {
        //openLinkedin(url: "https://www.google.com")
    }
    
}

extension DetailTeamViewController: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true) {
            //            print("Fazer alguma coisa")
        }
    }
    func safariViewController(_ controller: SFSafariViewController, didCompleteInitialLoad didLoadSuccessfully: Bool) {
        print("didLoadSuccessfully \(didLoadSuccessfully)")
    }
    
}

