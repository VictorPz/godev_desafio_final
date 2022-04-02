//
//  DetailItemStackView.swift
//  godev_projeto_final
//
//  Created by Rogério Tavares on 02/04/22.
//

import Foundation
import UIKit

struct ButtonInfo {
    var name: String
    var type: ButtonTypeEnum
}

class DetailItemStackView: CustomHorizontalStackView {
    
    lazy var iconImage: UIImageView = {
        let icon = CustomIconImage()
        return icon
    }()
    
    lazy var nameLabel: UILabel = {
        let label = CustomLabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    lazy var infoButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.label, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var dataButton: ButtonInfo?
    
    var delegate: DetailItemStackViewDelegate?
    
    init() {
        super.init(frame: .zero)
        self.configStack()
        configureView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(icon: String, name: String, button: ButtonInfo) {
        iconImage.image = UIImage(systemName: icon)
        nameLabel.text = "\(name):"
        infoButton.addTarget(self, action: #selector(infoButtonSelector), for: .touchUpInside)
        infoButton.setTitle(button.name, for: .normal)
        dataButton = button
    }
    
    @objc
    private func infoButtonSelector() {
        guard let data = dataButton else { return }
        
        detailButtonPressed(type: data.type)
    }
    
    private func detailButtonPressed(type: ButtonTypeEnum) {
        switch type {
        case .phone(let phone):
            delegate?.detailButtonPressedPhone(phone)
        case .email(let email):
            delegate?.detailButtonPressedEmail(email)
        case .linkedin(let linkedin):
            delegate?.detailButtonPressedLinkedin(linkedin)
        case .github(let github):
            delegate?.detailButtonPressedGithub(github)
        }
    }
    
    private func configureView() {
        addArrangedSubviews(iconImage, nameLabel, infoButton)
        
        NSLayoutConstraint.activate([
            iconImage.widthAnchor.constraint(equalToConstant: 36),
            iconImage.heightAnchor.constraint(equalToConstant: 36),
            nameLabel.widthAnchor.constraint(equalToConstant: 78),
        ])
    }
}
