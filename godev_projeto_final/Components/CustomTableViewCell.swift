//
//  CustomTableViewCell.swift
//  godev_projeto_final
//
//  Created by Victor Pizetta on 23/03/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    //MARK: - Components
    
    static let identifier = "CustomTableViewCell"
    
    private lazy var verticalStack: UIStackView = {
        let stack  = UIStackView(frame: .zero)
        stack.alignment = .fill
        stack.spacing = 0
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        return stack
    }()
        
    private lazy var repositoryTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return label
    }()

    private lazy var repositoryDescription: UITextView = {
        let description = UITextView()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.textColor = UIColor.black
        description.font = UIFont.systemFont(ofSize: 12, weight: .light)
        description.textAlignment = .justified
        return description
    }()
    
    private lazy var ownerImage: UIImageView = {
        let ownerImage = UIImageView()
        ownerImage.translatesAutoresizingMaskIntoConstraints = false
        return ownerImage
    }()
    
    
    //MARK: - Inicialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView(repo: GitHubRepo) {
        repositoryTitle.text = repo.name
        repositoryDescription.text = repo.description
        ownerImage.loadImage(from: repo.owner.avatar_url)
    }
}

//MARK: - Extensions

extension CustomTableViewCell: ViewCodable {
    
    func buildHierarchy() {
        addSubview(ownerImage)
        ownerImage.layer.cornerRadius = ownerImage.layer.frame.width / 2
        addSubview(verticalStack)
        verticalStack.addArrangedSubview(repositoryTitle)
        verticalStack.addArrangedSubview(repositoryDescription)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            ownerImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            ownerImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            ownerImage.heightAnchor.constraint(equalTo: heightAnchor, constant: 75),
            ownerImage.widthAnchor.constraint(equalTo: widthAnchor, constant: 75),
            
            verticalStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            verticalStack.leadingAnchor.constraint(equalTo: ownerImage.trailingAnchor,
                                                   constant: 10),
            verticalStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            repositoryTitle.heightAnchor.constraint(equalTo: heightAnchor, constant: 20),
            repositoryDescription.heightAnchor.constraint(equalTo: heightAnchor, constant: 50)
        ])
    }
}
