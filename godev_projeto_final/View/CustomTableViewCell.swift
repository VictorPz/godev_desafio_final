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
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.contentMode = .top
        stack.spacing = 8
        stack.axis = .vertical
        return stack
    }()
        
    private lazy var repositoryTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()

    //Tava como UITextView mudei para UILabel - Rafael
    private lazy var repositoryDescription: UILabel = {
        let description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.textColor = UIColor.black
        description.numberOfLines = 2
        description.font = UIFont.systemFont(ofSize: 14, weight: .light)
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
        accessoryType = .disclosureIndicator
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView(repo: GitHubRepo) {
        repositoryTitle.text = repo.name
        repositoryDescription.text = repo.description
        
        self.ownerImage.layer.cornerRadius = 42.5
        //por padrão o UIImageView vem com o masksToBounds = false, se não tiver true não arrendonda a imagem, mesmo setando - Rafael
        self.ownerImage.layer.masksToBounds = true
        ownerImage.loadImage(from: repo.owner.avatar_url)
    }
}

//MARK: - Extensions

extension CustomTableViewCell: ViewCodable {
    
    func buildHierarchy() {
        addSubview(ownerImage)
        
        verticalStack.addArrangedSubview(repositoryTitle)
        verticalStack.addArrangedSubview(repositoryDescription)
        
        addSubview(verticalStack)
        
    }
    
    func setupConstraints() {
        ownerImage.layer.cornerRadius = ownerImage.layer.frame.width / 2
        NSLayoutConstraint.activate([
            ownerImage.heightAnchor.constraint(equalToConstant: 85),
            ownerImage.widthAnchor.constraint(equalToConstant: 85),
            ownerImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            ownerImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            //ownerImage.topAnchor.constraint(lessThanOrEqualTo: topAnchor, constant: 10),
            //ownerImage.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -10),
            
            //Como está dentro de uma stack view não precisa desses caras, pois ele quebra o layout - Rafael
            //repositoryTitle.heightAnchor.constraint(equalToConstant: 20),
            //repositoryDescription.heightAnchor.constraint(equalTo: heightAnchor, constant: 50),
            
            verticalStack.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            verticalStack.leadingAnchor.constraint(equalTo: ownerImage.trailingAnchor, constant: 10),
            verticalStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            verticalStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -35)
        ])
    }
}
