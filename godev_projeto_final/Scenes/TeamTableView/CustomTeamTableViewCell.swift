//
//  CustomTeamTableViewCell.swift
//  godev_projeto_final
//
//  Created by Aloc SP11704 on 27/03/22.
//

import UIKit

final class CustomTeamTableViewCell: UITableViewCell {
    
    static let identifier = "CustomTeamTableViewCell"
    
    // MARK: - Components
    
    private lazy var photoImage: CustomIconImage = {
        let image = CustomIconImage()
        return image
    }()
    
    private lazy var stackView: CustomVerticalStackView = {
        let stack = CustomVerticalStackView(frame: .zero)
        return stack
    }()
    
    private lazy var nameLabel: CustomTitleLabel = {
        let label = CustomTitleLabel()
        return label
    }()
    
    private lazy var ocupationLabel: CustomBodyLabel = {
        let label = CustomBodyLabel()
        return label
    }()
    
    // MARK: - Inicialization
    
    func updateView(team: Team){
        photoImage.image = UIImage(named: team.image)
        photoImage.layer.cornerRadius = Metrics.Radius.defaultImageCornerRadius
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

extension CustomTeamTableViewCell: ViewCodable{
    
    func buildHierarchy() {
        addSubview(photoImage)
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(ocupationLabel)
        
        addSubview(stackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            photoImage.heightAnchor.constraint(equalToConstant: Metrics.Height.defaultHeightCellImage),
            photoImage.widthAnchor.constraint(equalToConstant: Metrics.Width.defaultWidthCellImage),
            photoImage.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: Metrics.Margin.defaultLeading),
            photoImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: Metrics.Margin.defaultTop),
            stackView.leadingAnchor.constraint(equalTo: photoImage.trailingAnchor, constant: Metrics.Margin.defaultLeading),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: Metrics.Margin.defaultBottom - 15),
            stackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: Metrics.Margin.defaultTrailing - 20)
        ])
    }
}
