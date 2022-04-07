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
    
    //MARK: - Components
    
    private lazy var ownerImage: CustomIconImage = {
        let image = CustomIconImage()
        return image
    }()
    
    private lazy var verticalStack: CustomVerticalStackView = {
        let stack = CustomVerticalStackView(frame: .zero)
        return stack
    }()
    
    private lazy var descriptionLabel: CustomBodyLabel = {
        let description = CustomBodyLabel()
        return description
    }()
    
    private lazy var authorHorizontalStack: CustomHorizontalStackView = {
        let stack = CustomHorizontalStackView()
        return stack
    }()
    
    private lazy var iconImageView: CustomIconImage = {
        let icon = CustomIconImage()
        icon.image = UIImage(systemName: "person.crop.square")
        return icon
    }()
    
    private lazy var authorLabel: CustomTitleLabel = {
        let label = CustomTitleLabel()
        label.text = "Autor:"
        return label
    }()
    
    private lazy var authorNameLabel: CustomSubTitleLabel = {
        let label = CustomSubTitleLabel()
        return label
    }()
    
    private lazy var countObserversContaineHorizontalStack: CustomHorizontalStackView = {
        let stack = CustomHorizontalStackView()
        return stack
    }()
    
    private lazy var iconEyeImage: CustomIconImage = {
        let icon = CustomIconImage()
        icon.image = UIImage(systemName: "eye")
        return icon
    }()
    
    private lazy var countObserversLabel: CustomTitleLabel = {
        let label = CustomTitleLabel()
        label.text = "Contatem de observadores:"
        return label
    }()
    
    private lazy var countInfoLabel: CustomSubTitleLabel = {
        let label = CustomSubTitleLabel()
        return label
    }()
    
    private lazy var dataCreationContaineHorizontalStack: CustomHorizontalStackView = {
        let stack = CustomHorizontalStackView()
        return stack
    }()
    
    private lazy var iconClockImage: CustomIconImage = {
        let icon = CustomIconImage()
        icon.image = UIImage(systemName: "alarm.fill")
        return icon
    }()
    
    private lazy var dataLabel: CustomTitleLabel = {
        let label = CustomTitleLabel()
        label.text = "Data de criação:"
        return label
    }()
    
    private lazy var dataInfoLabel: CustomSubTitleLabel = {
        let label = CustomSubTitleLabel()
        return label
    }()
    
    private lazy var licenceContaineHorizontalStack: CustomHorizontalStackView = {
        let stack = CustomHorizontalStackView()
        return stack
    }()
    
    private lazy var iconGlobeImage: CustomIconImage = {
        let icon = CustomIconImage()
        icon.image = UIImage(systemName: "globe")
        return icon
    }()
    
    private lazy var licenceLabel: CustomTitleLabel = {
        let label = CustomTitleLabel()
        label.text = "Licença:"
        return label
    }()
    
    private lazy var licenceInfoLabel: CustomSubTitleLabel = {
        let label = CustomSubTitleLabel()
        return label
    }()
    
    private lazy var linkRepoButton: CustomButton = {
        let button = CustomButton()
        button.setTitle("Link do Repositório", for: .normal)
        button.addTarget(self, action: #selector(callRepo), for: .touchUpInside)
        return button
    }()
    
    var delegate: DetailRepositoryViewDelegate?
    var repo: Repo?
    
    //MARK: - Inicialization
    
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
        let url = URL(string: infoRepo.owner.avatarUrl)
        ownerImage.kf.setImage(with: url)
        descriptionLabel.text = infoRepo.description ?? "No Description"
        authorNameLabel.text = infoRepo.owner.login
        countInfoLabel.text = String(infoRepo.watchersCount)
        dataInfoLabel.text = String().convertStringDateFormat(stringVariable: infoRepo.createdAt)
        licenceInfoLabel.text = infoRepo.license?.name ?? "No License"
        repo = infoRepo
    }
    
    public func addFavoriteRepo(infoRepo: Repo) {
        if let image = ownerImage.image?.pngData() {
            
            let owner = Owner(login: infoRepo.owner.login, avatarUrl: infoRepo.owner.avatarUrl, avatarImage: image)
            let license = License(name: infoRepo.license?.name ?? "No License")
            
            let repo = Repo(id: infoRepo.id, name: infoRepo.name, htmlURL: infoRepo.htmlURL, description: infoRepo.description ?? "No Description", watchersCount: infoRepo.watchersCount, createdAt: infoRepo.createdAt, owner: owner, license: license)

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

//MARK: - Extensions

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
        NSLayoutConstraint.activate([
            ownerImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Metrics.Margin.defaultTop),
            ownerImage.heightAnchor.constraint(equalToConstant: Metrics.Height.defaultHeightImage),
            ownerImage.widthAnchor.constraint(equalToConstant: Metrics.Width.defaultWidthImage),
            ownerImage.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            verticalStack.topAnchor.constraint(equalTo: ownerImage.bottomAnchor, constant: Metrics.Margin.defaultTop),
            verticalStack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Metrics.Margin.defaultLeading),
            verticalStack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: Metrics.Margin.defaultTrailing),
        ])
        
        NSLayoutConstraint.activate([
            iconImageView.widthAnchor.constraint(equalToConstant: Metrics.Width.defaultWidthIcon),
            iconImageView.heightAnchor.constraint(equalToConstant:  Metrics.Height.defaultHeightIcon),
        ])
        
        NSLayoutConstraint.activate([
            authorLabel.widthAnchor.constraint(equalToConstant: 50),
        ])
        
        NSLayoutConstraint.activate([
            iconEyeImage.widthAnchor.constraint(equalToConstant: Metrics.Width.defaultWidthIcon),
            iconEyeImage.heightAnchor.constraint(equalToConstant: Metrics.Height.defaultHeightIcon),
        ])
        
        NSLayoutConstraint.activate([
            countObserversLabel.widthAnchor.constraint(equalToConstant: 220),
        ])
        
        NSLayoutConstraint.activate([
            iconClockImage.widthAnchor.constraint(equalToConstant: Metrics.Width.defaultWidthIcon),
            iconClockImage.heightAnchor.constraint(equalToConstant: Metrics.Height.defaultHeightIcon),
        ])
        
        NSLayoutConstraint.activate([
            //dataLabel.widthAnchor.constraint(equalToConstant: 140),
        ])
        
        NSLayoutConstraint.activate([
            iconGlobeImage.widthAnchor.constraint(equalToConstant: Metrics.Width.defaultWidthIcon),
            iconGlobeImage.heightAnchor.constraint(equalToConstant: Metrics.Height.defaultHeightIcon),
        ])
        
        NSLayoutConstraint.activate([
            licenceLabel.widthAnchor.constraint(equalToConstant: 65),
        ])
        
        NSLayoutConstraint.activate([
            linkRepoButton.topAnchor.constraint(equalTo: verticalStack.bottomAnchor, constant: Metrics.Margin.defaultTop + 14),
            linkRepoButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Metrics.Margin.defaultLeading),
            linkRepoButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: Metrics.Margin.defaultTrailing),
            linkRepoButton.heightAnchor.constraint(equalToConstant: Metrics.Height.defaultHeightButton)
        ])
    }

    func applyAdditionalChanges() {
        backgroundColor = .systemBackground
    }
}
