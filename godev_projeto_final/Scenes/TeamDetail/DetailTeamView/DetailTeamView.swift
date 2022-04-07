//
//  TeamDetailView.swift
//  godev_projeto_final
//
//  Created by Rogério Tavares on 02/04/22.
//

import UIKit

protocol TeamDetailViewDelegate: DetailItemStackViewDelegate {}

final class DetailTeamView: UIView {
    
    // MARK: - Components
    
    private lazy var verticalStack: CustomVerticalStackView = {
        let stack = CustomVerticalStackView()
        return stack
    }()
    
    private lazy var personImage: CustomIconImage = {
        let image = CustomIconImage()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var descriptionLabel: CustomBodyLabel = {
        let description = CustomBodyLabel()
        return description
    }()
    
    private lazy var phoneHorizontalStack: DetailItemStackView = {
        let stack = DetailItemStackView()
        return stack
    }()
    
    private lazy var emailHorizontalStack: DetailItemStackView = {
        let stack = DetailItemStackView()
        return stack
    }()
    
    private lazy var linkedinHorizontalStack: DetailItemStackView = {
        let stack = DetailItemStackView()
        return stack
    }()
    
    private lazy var githubHorizontalStack: DetailItemStackView = {
        let stack = DetailItemStackView()
        return stack
    }()
    
    var delegate: TeamDetailViewDelegate? {
        didSet {
            stackDelegates()
        }
    }
    
    //MARK: - Inicialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func stackDelegates() {
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

//MARK: - Extensions

extension DetailTeamView: ViewCodable {
    func buildHierarchy() {
        addSubViews(personImage, descriptionLabel, verticalStack)
        verticalStack.addArrangedSubviews(phoneHorizontalStack, emailHorizontalStack, linkedinHorizontalStack, githubHorizontalStack)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            personImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Metrics.Margin.defaultTop),
            personImage.heightAnchor.constraint(equalToConstant: Metrics.Height.defaultHeightImage),
            personImage.widthAnchor.constraint(equalToConstant: Metrics.Width.defaultWidthImage),
            personImage.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: personImage.bottomAnchor, constant: Metrics.Margin.defaultTop),
            descriptionLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Metrics.Margin.defaultLeading),
            descriptionLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: Metrics.Margin.defaultTrailing),
        ])
        
        NSLayoutConstraint.activate([
            verticalStack.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: Metrics.Margin.defaultTop),
            verticalStack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Metrics.Margin.defaultLeading),
            verticalStack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: Metrics.Margin.defaultTrailing),
        ])
    }
    
    func applyAdditionalChanges() {
        backgroundColor = .defaultBackgroundColor
    }
}
