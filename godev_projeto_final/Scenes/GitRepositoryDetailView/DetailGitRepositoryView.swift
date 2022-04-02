//
//  DetailGitRepositoryView.swift
//  godev_projeto_final
//
//  Created by Idwall Go Dev 008 on 25/03/22.
//

import UIKit

class DetailRepositoryView: UIView {
    
    private var safeArea: UILayoutGuide!
    
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
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        safeArea = safeAreaLayoutGuide
        setupView()
    }
    
    func setupInfoRepo(infoRepo: GitHubRepo) {
        ownerImage.loadImage(from: infoRepo.owner.avatar_url)
        descriptionLabel.text = infoRepo.description
        authorNameLabel.text = infoRepo.owner.login
        countInfoLabel.text = String(infoRepo.watchers_count)
        dataInfoLabel.text = String().convertStringDateFormat(stringVariable: infoRepo.created_at)
        licenceInfoLabel.text = infoRepo.license?.name
        
    }
    
    func favoriteRepo(infoRepo: GitHubRepo) {
        let image = ownerImage.image?.pngData()

        let repoTest = CoreDataRepo(id: infoRepo.id, name: infoRepo.name, image: image!, details: infoRepo.description!, author: infoRepo.owner.login, viewsCount: infoRepo.watchers_count, createdAt: infoRepo.created_at, license: infoRepo.license!.name, url: infoRepo.html_url)

        ManagedObjectContext.shared.saveRepoData(repo: repoTest) { res in
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
            ownerImage.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
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
