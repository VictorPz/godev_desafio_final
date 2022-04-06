//
//  CustomHomeTableViewCell.swift
//  godev_projeto_final
//
//  Created by Victor Pizetta on 23/03/22.
//

import UIKit

final class CustomHomeTableViewCell: UITableViewCell {
    
    //MARK: - Components
    
    static let identifier = "CustomHomeTableViewCell"
    
    private lazy var verticalStack: CustomVerticalStackView = {
        let stack  = CustomVerticalStackView(frame: .zero)
        return stack
    }()
    
    private lazy var repositoryTitle: CustomTitleLabel = {
        let label = CustomTitleLabel()
        return label
    }()

    private lazy var repositoryDescription: CustomBodyLabel = {
        let description = CustomBodyLabel()
        return description
    }()
    
    private lazy var ownerImage: CustomIconImage = {
        let ownerImage = CustomIconImage()
        ownerImage.translatesAutoresizingMaskIntoConstraints = false
        return ownerImage
    }()
    
    //MARK: - Inicialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        accessoryType = .disclosureIndicator
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateHomeView(repo: Repo) {
        repositoryTitle.text = repo.name
        repositoryDescription.text = repo.description
        
        self.ownerImage.layer.cornerRadius = Metrics.Radius.defaultImageCornerRadius
        self.ownerImage.layer.masksToBounds = true
        ownerImage.loadImage(from: repo.owner.avatarUrl)
    }
    
    func updateFavoriteView(repoTitle: String, repoDescription: String, image: UIImage) {
        repositoryTitle.text = repoTitle
        repositoryDescription.text = repoDescription
        ownerImage.image = image
        ownerImage.layer.masksToBounds = true
        ownerImage.layer.cornerRadius = Metrics.Radius.defaultImageCornerRadius
    }
}

//MARK: - Extensions

extension CustomHomeTableViewCell: ViewCodable {
    
    func buildHierarchy() {
        addSubview(ownerImage)
        
        verticalStack.addArrangedSubview(repositoryTitle)
        verticalStack.addArrangedSubview(repositoryDescription)
    
        addSubview(verticalStack)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            ownerImage.heightAnchor.constraint(equalToConstant: Metrics.Height.defaultHeightCellImage),
            ownerImage.widthAnchor.constraint(equalToConstant: Metrics.Width.defaultWidthCellImage),
            ownerImage.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: Metrics.Margin.defaultLeading),
            ownerImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            verticalStack.topAnchor.constraint(equalTo: self.topAnchor, constant: Metrics.Margin.defaultTop),
            verticalStack.leadingAnchor.constraint(equalTo: ownerImage.trailingAnchor, constant: Metrics.Margin.defaultLeading),
            verticalStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: Metrics.Margin.defaultBottom - 20),
            verticalStack.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: Metrics.Margin.defaultTrailing - 20)
        ])
    }
}
