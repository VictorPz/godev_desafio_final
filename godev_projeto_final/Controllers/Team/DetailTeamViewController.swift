//
//  DetailTeamViewController.swift
//  godev_projeto_final
//
//  Created by Victor Pizetta on 01/04/22.
//

import UIKit
import SafariServices
import MessageUI

class DetailTeamViewController: UIViewController {
    
    lazy var verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.contentMode = .top
        stack.spacing = 8
        stack.axis = .vertical
        return stack
    }()
    
    lazy var personImage: UIImageView = {
        let image = CustomIconImage()
        image.image = UIImage(systemName: "person")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var descriptionLabel: UILabel = {
        let description = CustomLabel()
        description.text = "A curated list of awesome iOS ecosystem, including Objective-C and Swift Projects"
        description.font = UIFont.systemFont(ofSize: 17, weight: .light)
        description.textAlignment = .justified
        return description
    }()
    
    lazy var phoneHorizontalStack: DetailItemStackView = {
        let stack = DetailItemStackView()
        return stack
    }()
    
    lazy var emailHorizontalStack: DetailItemStackView = {
        let stack = DetailItemStackView()
        return stack
    }()
    
    lazy var linkedinHorizontalStack: DetailItemStackView = {
        let stack = DetailItemStackView()
        return stack
    }()
    
    lazy var githubHorizontalStack: DetailItemStackView = {
        let stack = DetailItemStackView()
        return stack
    }()
    
    override func viewDidLoad() {
        setupView()
    }
    
    func setupInfo(infoRepo: Team) {
        personImage.image = UIImage(named: infoRepo.image)
        descriptionLabel.text = infoRepo.description
        
        let phoneButtonInfo = ButtonInfo(name: infoRepo.fone, type: .phone(infoRepo.fone))
        phoneHorizontalStack.configure(icon: "phone", name: "Telefone", button: phoneButtonInfo)
        phoneHorizontalStack.delegate = self
        
        let emailButtonInfo = ButtonInfo(name: infoRepo.email, type: .email(infoRepo.email))
        emailHorizontalStack.configure(icon: "envelope", name: "Email", button: emailButtonInfo)
        emailHorizontalStack.delegate = self
        
        let linkedinButtonInfo = ButtonInfo(name: infoRepo.linkedin, type: .linkedin(infoRepo.linkedin))
        linkedinHorizontalStack.configure(icon: "globe", name: "Linkedin", button: linkedinButtonInfo)
        linkedinHorizontalStack.delegate = self
        
        let githubButtonInfo = ButtonInfo(name: infoRepo.github, type: .github(infoRepo.github))
        githubHorizontalStack.configure(icon: "globe", name: "Github", button: githubButtonInfo)
        githubHorizontalStack.delegate = self
    }
    
}

extension DetailTeamViewController: DetailItemStackViewDelegate {
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
        
        present(safariViewController, animated: true)
    }
    
    func detailButtonPressedGithub(_ value: String) {
        guard let url = URL(string: value) else { return }
        
        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = true
        
        let safariViewController = SFSafariViewController(url: url, configuration: config)
        safariViewController.delegate = self
        safariViewController.dismissButtonStyle = .close
        
        present(safariViewController, animated: true)
    }
}

extension DetailTeamViewController: MFMailComposeViewControllerDelegate {
    
}

extension DetailTeamViewController: SFSafariViewControllerDelegate {
    //    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
    //        controller.dismiss(animated: true) {
    //            //            print("Fazer alguma coisa")
    //        }
    //    }
    //    func safariViewController(_ controller: SFSafariViewController, didCompleteInitialLoad didLoadSuccessfully: Bool) {
    //        print("didLoadSuccessfully \(didLoadSuccessfully)")
    //    }
    //
}


extension DetailTeamViewController: ViewCodable {
    func buildHierarchy() {
        view.addSubViews(personImage, descriptionLabel, verticalStack)
        verticalStack.addArrangedSubviews(phoneHorizontalStack, emailHorizontalStack, linkedinHorizontalStack, githubHorizontalStack)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            personImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            personImage.heightAnchor.constraint(equalToConstant: 200),
            personImage.widthAnchor.constraint(equalToConstant: 200),
            personImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: personImage.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
        
        NSLayoutConstraint.activate([
            verticalStack.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 23),
            verticalStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            verticalStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
    }
    
    func applyAdditionalChanges() {
        view.backgroundColor = .systemBackground
    }
}

