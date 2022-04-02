//
//  TeamDetailView.swift
//  godev_projeto_final
//
//  Created by Victor Pizetta on 01/04/22.
//

import UIKit
import MessageUI



class TeamDetailView: UIView {
    
    private var safeArea: UILayoutGuide!
    
    //MARK: -Stacks
    
    lazy var verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.contentMode = .top
        stack.spacing = 8
        stack.axis = .vertical
        return stack
    }()
    
    lazy var telefoneHorizontalStack: UIStackView = {
        let stack = CustomHorizontalStackView()
        return stack
    }()
    
    lazy var emailHorizontalStack: UIStackView = {
        let stack = CustomHorizontalStackView()
        return stack
    }()
    
    lazy var linkedinHorizontalStack: UIStackView = {
        let stack = CustomHorizontalStackView()
        return stack
    }()
    
    lazy var githubHorizontalStack: UIStackView = {
        let stack = CustomHorizontalStackView()
        return stack
    }()
    
    //MARK: -Components
    
    lazy var personImage: UIImageView = {
        let image = CustomIconImage()
        image.image = UIImage(systemName: "person")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var descriptionLabel: UILabel = {
        let description = CustomLabel()
        description.text = "A curated list of awesome iOS ecosystem, including Objective-C and Swift Projects"
        description.font = UIFont.systemFont(ofSize: 17, weight: .light)
        description.textAlignment = .justified
        return description
    }()
    
    lazy var telImage: UIImageView = {
        let icon = CustomIconImage()
        icon.image = UIImage(systemName: "phone")
        return icon
    }()
    
    lazy var telLabel: UILabel = {
        let label = CustomLabel()
        label.text = "Telefone:"
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    lazy var telNumberButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.label, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        button.addTarget(self, action: #selector(openPhone), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var emailImage: UIImageView = {
        let icon = CustomIconImage()
        icon.image = UIImage(systemName: "envelope")
        return icon
    }()
    
    lazy var emailLabel: UILabel = {
        let label = CustomLabel()
        label.text = "Email:"
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    lazy var emailContentButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.label, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        button.addTarget(self, action: #selector(openEmail), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var linkedinImage: UIImageView = {
        let icon = CustomIconImage()
        icon.image = UIImage(systemName: "globe")
        return icon
    }()
    
    lazy var linkedinLabel: UILabel = {
        let label = CustomLabel()
        label.text = "LinkedIn:"
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    //    lazy var linkedinUrlLabel: UILabel = {
    //        let label = CustomLabel()
    //        label.text = "url"
    //        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
    //        return label
    //    }()
    
    lazy var linkedinUrlButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.label, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        button.addTarget(self, action: #selector(openLinkedin), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var githubImage: UIImageView = {
        let icon = CustomIconImage()
        icon.image = UIImage(systemName: "globe")
        return icon
    }()
    
    lazy var githubLabel: UILabel = {
        let label = CustomLabel()
        label.text = "Github:"
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    lazy var githubUrlLabel: UILabel = {
        let label = CustomLabel()
        label.text = "url git"
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        safeArea = safeAreaLayoutGuide
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupInfo(infoRepo: Team) {
        personImage.image = UIImage(named: infoRepo.image)
        descriptionLabel.text = infoRepo.description
        emailContentButton.setTitle(infoRepo.email, for: .normal)
        telNumberButton.setTitle(infoRepo.fone, for: .normal)
        linkedinUrlButton.setTitle(infoRepo.linkedin, for: .normal)
        githubUrlLabel.text = infoRepo.github
    }
    
    @objc func openPhone() {
        let scheme = "tel://+55\(String(describing: telNumberButton.titleLabel!.text))"
        print(scheme)
        
        if let url = URL(string: scheme) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
    }
    
    @objc func openEmail() {
        let detailTeamViewController = DetailTeamViewController()
        let recipientEmail: String = (emailContentButton.titleLabel?.text)!
        let subject = "App - Repositórios do Github"
        let body = "Olá!\nEstou entrando em contato clicando no botão e-mail do app de repositórios do Github!"
        
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            
            mail.mailComposeDelegate = self
            mail.setCcRecipients([recipientEmail])
            mail.setSubject(subject)
            mail.setMessageBody(body, isHTML: false)
            
            detailTeamViewController.presents(view: mail)
            
        }
    }
    
    @objc func openLinkedin() {
        let detailTeamViewController = DetailTeamViewController()
        detailTeamViewController.openLinkedin(url: (linkedinUrlButton.titleLabel?.text)!)
    }
    
}

extension TeamDetailView: ViewCodable {
    
    func buildHierarchy() {
        
        verticalStack.addArrangedSubviews(descriptionLabel,
                                          telefoneHorizontalStack,
                                          emailHorizontalStack,
                                          linkedinHorizontalStack,
                                          githubHorizontalStack)
        
        telefoneHorizontalStack.addArrangedSubviews(telImage, telLabel, telNumberButton)
        emailHorizontalStack.addArrangedSubviews(emailImage, emailLabel, emailContentButton)
        linkedinHorizontalStack.addArrangedSubviews(linkedinImage, linkedinLabel, linkedinUrlButton)
        githubHorizontalStack.addArrangedSubviews(githubImage, githubLabel, githubUrlLabel)
        
        addSubViews(personImage, verticalStack)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            personImage.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
            personImage.heightAnchor.constraint(equalToConstant: 200),
            personImage.widthAnchor.constraint(equalToConstant: 200),
            personImage.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            verticalStack.topAnchor.constraint(equalTo: personImage.bottomAnchor, constant: 23),
            verticalStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            verticalStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
        
        NSLayoutConstraint.activate([
            telImage.widthAnchor.constraint(equalToConstant: 36),
            telImage.heightAnchor.constraint(equalToConstant: 36),
            telLabel.widthAnchor.constraint(equalToConstant: 78),
        ])
        
        NSLayoutConstraint.activate([
            emailImage.widthAnchor.constraint(equalToConstant: 30),
            emailImage.heightAnchor.constraint(equalToConstant: 30),
            emailLabel.widthAnchor.constraint(equalToConstant: 50),
        ])
        
        NSLayoutConstraint.activate([
            linkedinImage.widthAnchor.constraint(equalToConstant: 30),
            linkedinImage.heightAnchor.constraint(equalToConstant: 30),
            linkedinLabel.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        NSLayoutConstraint.activate([
            githubImage.widthAnchor.constraint(equalToConstant: 30),
            githubImage.heightAnchor.constraint(equalToConstant: 30),
            githubLabel.widthAnchor.constraint(equalToConstant: 65),
        ])
    }
    
    func applyAdditionalChanges() {
        backgroundColor = .systemBackground
    }
}

extension TeamDetailView: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        switch result {
            
        case .cancelled:
            print("Canceled")
        case .saved:
            print("Saved")
        case .sent:
            print("Sent")
        case .failed:
            print("Failed")
        @unknown default:
            print("Defaul")
        }
    }
}

