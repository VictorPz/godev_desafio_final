//
//  DetailGitRepositoryView.swift
//  godev_projeto_final
//
//  Created by Idwall Go Dev 008 on 25/03/22.
//

import UIKit

protocol DetailRepositoryViewDelegate {
    func detailButtonPressedGithub(_ value: String)
}

class DetailRepositoryView: UIView {
    
    lazy var ownerImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "person")
        return image
    }()
    
    lazy var verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.contentMode = .top
        stack.spacing = 8
        stack.axis = .vertical
        return stack
    }()
    
    lazy var descriptionLabel: UILabel = {
        let description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.textColor = UIColor.black
        description.numberOfLines = 0
        description.text = "A curated list of awesome iOS ecosystem, including Objective-C and Swift Projects"
        description.font = UIFont.systemFont(ofSize: 17, weight: .light)
        description.textAlignment = .justified
        return description
    }()
    
    lazy var authorHorizontalStack: UIStackView = {
        let stack = CustomHorizontalStackView()
        return stack
    }()
    
    lazy var iconImageView: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.image = UIImage(systemName: "person.crop.square")
        icon.tintColor = .label
        return icon
    }()
    
    lazy var authorLabel: UILabel = {
        let label = CustomLabel()
        label.text = "Autor:"
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    lazy var authorNameLabel: UILabel = {
        let label = CustomLabel()
        label.text = "Rafael Rocha dos Santos"
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    lazy var countObserversContaineHorizontalStack: UIStackView = {
        let stack = CustomHorizontalStackView()
        return stack
    }()
    
    lazy var iconEyeImage: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.image = UIImage(systemName: "eye")
        icon.tintColor = .label
        return icon
    }()
    
    lazy var countObserversLabel: UILabel = {
        let label = CustomLabel()
        label.text = "Contatem de observadores:"
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    lazy var countInfoLabel: UILabel = {
        let label = CustomLabel()
        label.text = "00000"
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    lazy var dataCreationContaineHorizontalStack: UIStackView = {
        let stack = CustomHorizontalStackView()
        return stack
    }()
    
    lazy var iconClockImage: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.image = UIImage(systemName: "alarm.fill")
        icon.tintColor = .label
        return icon
    }()
    
    lazy var dataLabel: UILabel = {
        let label = CustomLabel()
        label.text = "Data de criação:"
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    lazy var dataInfoLabel: UILabel = {
        let label = CustomLabel()
        label.text = "00/00/0000"
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    lazy var licenceContaineHorizontalStack: UIStackView = {
        let stack = CustomHorizontalStackView()
        return stack
    }()
    
    lazy var iconGlobeImage: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.image = UIImage(systemName: "globe")
        icon.tintColor = .label
        return icon
    }()
    
    lazy var licenceLabel: UILabel = {
        let label = CustomLabel()
        label.text = "Licença:"
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    lazy var licenceInfoLabel: UILabel = {
        let label = CustomLabel()
        label.text = "MIT License"
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    lazy var linkRepoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Link do Repositório", for: .normal)
        button.setTitleColor(UIColor.label, for: .normal)
        button.addTarget(self, action: #selector(callRepo), for: .touchUpInside)
        return button
    }()
    
    var delegate: DetailRepositoryViewDelegate?
    var repo: Repo?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    @objc
    private func callRepo(){
        guard let repo = self.repo else { return }
        
        delegate?.detailButtonPressedGithub(repo.htmlURL)
    }
    
    func setupInfoRepo(infoRepo: Repo) {
        ownerImage.loadImage(from: infoRepo.owner.avatarUrl)
        descriptionLabel.text = infoRepo.description
        authorNameLabel.text = infoRepo.owner.login
        countInfoLabel.text = String(infoRepo.watchersCount)
        dataInfoLabel.text = String().convertStringDateFormat(stringVariable: infoRepo.createdAt)
        licenceInfoLabel.text = infoRepo.license?.name
        repo = infoRepo
    }
    
    public func addFavoriteRepo(infoRepo: Repo) {
        if let image = ownerImage.image?.pngData() {
            
            let owner = Owner(login: infoRepo.owner.login, avatarUrl: infoRepo.owner.avatarUrl, avatarImage: image)
            let license = License(name: infoRepo.license?.name ?? "No License")
            
            let repo = Repo(id: infoRepo.id, name: infoRepo.name, htmlURL: infoRepo.htmlURL, description: infoRepo.description, watchersCount: infoRepo.watchersCount, createdAt: infoRepo.createdAt, owner: owner, license: license)

            ManagedObjectContext.shared.saveRepoData(repo: repo) { res in
                print(res)
            }
        }
    }
    
    public func removeFavoriteRepo(infoRepo: Repo) {
        ManagedObjectContext.shared.deleteRepoData(id: infoRepo.id) { res in
            print(res)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DetailRepositoryView: ViewCodable {
    func buildHierarchy() {
        
        verticalStack.addArrangedSubviews(descriptionLabel,
                                          authorHorizontalStack,
                                          countObserversContaineHorizontalStack,
                                          dataCreationContaineHorizontalStack,
                                          licenceContaineHorizontalStack)
        authorHorizontalStack.addArrangedSubviews(iconImageView, authorLabel, authorNameLabel)
        countObserversContaineHorizontalStack.addArrangedSubviews(iconEyeImage, countObserversLabel, countInfoLabel)
        dataCreationContaineHorizontalStack.addArrangedSubviews(iconClockImage, dataLabel, dataInfoLabel)
        licenceContaineHorizontalStack.addArrangedSubviews(iconGlobeImage, licenceLabel, licenceInfoLabel)
        
        addSubViews(ownerImage, verticalStack, linkRepoButton)
        
    }

    func setupConstraints() {
        //Constraint da imagem
        NSLayoutConstraint.activate([
            ownerImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            ownerImage.heightAnchor.constraint(equalToConstant: 150),
            ownerImage.widthAnchor.constraint(equalToConstant: 150),
            ownerImage.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
        
        //Constraint da vertical stack
        NSLayoutConstraint.activate([
            verticalStack.topAnchor.constraint(equalTo: ownerImage.bottomAnchor, constant: 23),
            verticalStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            verticalStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
        
        //icon Image Person
        NSLayoutConstraint.activate([
            iconImageView.widthAnchor.constraint(equalToConstant: 36),
            iconImageView.heightAnchor.constraint(equalToConstant: 36),
        ])
        
        //author label
        NSLayoutConstraint.activate([
            authorLabel.widthAnchor.constraint(equalToConstant: 52),
        ])
        
        //icon Image Eye
        NSLayoutConstraint.activate([
            iconEyeImage.widthAnchor.constraint(equalToConstant: 36),
            iconEyeImage.heightAnchor.constraint(equalToConstant: 36),
        ])
        
        //countObserverLabel
        NSLayoutConstraint.activate([
            countObserversLabel.widthAnchor.constraint(equalToConstant: 230),
        ])
        
        //icon Image clock
        NSLayoutConstraint.activate([
            iconClockImage.widthAnchor.constraint(equalToConstant: 36),
            iconClockImage.heightAnchor.constraint(equalToConstant: 36),
        ])
        
        //icon Image Globe
        NSLayoutConstraint.activate([
            iconGlobeImage.widthAnchor.constraint(equalToConstant: 36),
            iconGlobeImage.heightAnchor.constraint(equalToConstant: 36),
        ])
        
        //licenceLabel
        NSLayoutConstraint.activate([
            licenceLabel.widthAnchor.constraint(equalToConstant: 70),
        ])
        
        //Button link
        NSLayoutConstraint.activate([
            linkRepoButton.topAnchor.constraint(equalTo: verticalStack.bottomAnchor, constant: 50),
            linkRepoButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            linkRepoButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            linkRepoButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }

    func applyAdditionalChanges() {
        backgroundColor = .systemBackground
    }
}