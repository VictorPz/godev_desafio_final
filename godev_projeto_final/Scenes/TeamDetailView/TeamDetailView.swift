//
//  TeamDetailView.swift
//  godev_projeto_final
//
//  Created by Rogério Tavares on 02/04/22.
//

import UIKit

protocol TeamDetailViewDelegate: DetailItemStackViewDelegate {}

class TeamDetailView: UIView {
    
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
    
    var delegate: TeamDetailViewDelegate? {
        didSet {
            stackDelegates()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func stackDelegates() {
        phoneHorizontalStack.delegate = delegate
        emailHorizontalStack.delegate = delegate
        linkedinHorizontalStack.delegate = delegate
        githubHorizontalStack.delegate = delegate
    }
    
    func setupInfo(infoRepo: Team) {
        personImage.image = UIImage(named: infoRepo.image)
        descriptionLabel.text = infoRepo.description
        
        let phoneButtonInfo = ButtonInfo(name: infoRepo.fone, type: .phone(infoRepo.fone))
        phoneHorizontalStack.configure(icon: "phone", name: "Telefone", button: phoneButtonInfo)
        
        let emailButtonInfo = ButtonInfo(name: infoRepo.email, type: .email(infoRepo.email))
        emailHorizontalStack.configure(icon: "envelope", name: "Email", button: emailButtonInfo)
        
        let linkedinButtonInfo = ButtonInfo(name: infoRepo.linkedin, type: .linkedin(infoRepo.linkedin))
        linkedinHorizontalStack.configure(icon: "globe", name: "Linkedin", button: linkedinButtonInfo)
        
        let githubButtonInfo = ButtonInfo(name: infoRepo.github, type: .github(infoRepo.github))
        githubHorizontalStack.configure(icon: "globe", name: "Github", button: githubButtonInfo)
    }
}

extension TeamDetailView: ViewCodable {
    func buildHierarchy() {
        addSubViews(personImage, descriptionLabel, verticalStack)
        verticalStack.addArrangedSubviews(phoneHorizontalStack, emailHorizontalStack, linkedinHorizontalStack, githubHorizontalStack)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            personImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            personImage.heightAnchor.constraint(equalToConstant: 200),
            personImage.widthAnchor.constraint(equalToConstant: 200),
            personImage.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: personImage.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
        
        NSLayoutConstraint.activate([
            verticalStack.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 23),
            verticalStack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            verticalStack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
    }
    
    func applyAdditionalChanges() {
        backgroundColor = .systemBackground
    }
}
