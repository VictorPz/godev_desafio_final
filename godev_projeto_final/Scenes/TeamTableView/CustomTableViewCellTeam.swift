//
//  CustomTableViewCellTeam.swift
//  godev_projeto_final
//
//  Created by Aloc SP11704 on 27/03/22.
//

import UIKit

class CustomTableViewCellTeam: UITableViewCell {
    
    static let identifier = "CustomTableViewCellTeam"
    
    // MARK: - Components
    
    private lazy var photoImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.contentMode = .top
        stack.spacing = 20
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var ocupationLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Inicialization
    
    func updateView(team: Team){
        photoImage.image = UIImage(named: team.image)
        photoImage.layer.cornerRadius = 42.5
        photoImage.layer.masksToBounds = true
        nameLabel.text = team.name
        ocupationLabel.text = team.ocupation
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        accessoryType = .disclosureIndicator
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - Extensions

extension CustomTableViewCellTeam: ViewCodable{
    
    func buildHierarchy() {
        addSubview(photoImage)
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(ocupationLabel)
        
        addSubview(stackView)
    }
    
    func setupConstraints() {
        photoImage.layer.cornerRadius = photoImage.layer.frame.width / 2
        NSLayoutConstraint.activate([
            photoImage.heightAnchor.constraint(equalToConstant: 85),
            photoImage.widthAnchor.constraint(equalToConstant: 85),
            photoImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            photoImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: photoImage.trailingAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -35)
        ])
    }
}
