//
//  DetailTeamViewController.swift
//  godev_projeto_final
//
//  Created by Victor Pizetta on 01/04/22.
//

import UIKit
import SafariServices
import MessageUI

final class DetailTeamViewController: UIViewController, SFSafariViewControllerDelegate {
    
    let detailTeamView = TeamDetailView()
    
    //MARK: - Life Cycle
    
    override func loadView() {
        self.view = self.detailTeamView
    }
    
    override func viewDidLoad() {
        detailTeamView.delegate = self
    }
    
}

//MARK: - Extensions

extension DetailTeamViewController: TeamDetailViewDelegate {
    func detailButtonPressedPhone(_ value: String) {
        let scheme = "tel://+55\(value)"
        print(scheme)
        
        if let url = URL(string: scheme) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
    }
    
    func detailButtonPressedEmail(_ value: String) {
        let subject = "App - Repositórios do Github"
        let body = "Olá!\nEstou entrando em contato clicando no botão e-mail do app de repositórios do Github!"
        
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            
            mail.mailComposeDelegate = self
            mail.setCcRecipients([value])
            mail.setSubject(subject)
            mail.setMessageBody(body, isHTML: false)
            
            present(mail, animated: true)
        }
    }
    
    func detailButtonPressedLinkedin(_ value: String) {
        guard let url = URL(string: value) else { return }
        
        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = true
        
        let safariViewController = SFSafariViewController(url: url, configuration: config)
        safariViewController.delegate = self
        safariViewController.dismissButtonStyle = .close
        safariViewController.preferredBarTintColor = .defaultBackgroundColor
        safariViewController.preferredControlTintColor = .defaultTintColor
        
        present(safariViewController, animated: true)
    }
    
    func detailButtonPressedGithub(_ value: String) {
        guard let url = URL(string: value) else { return }
        
        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = true
        
        let safariViewController = SFSafariViewController(url: url, configuration: config)
        safariViewController.delegate = self
        safariViewController.dismissButtonStyle = .close
        safariViewController.preferredBarTintColor = .defaultBackgroundColor
        safariViewController.preferredControlTintColor = .defaultTintColor
        
        present(safariViewController, animated: true)
    }
}

extension DetailTeamViewController: MFMailComposeViewControllerDelegate {
}




