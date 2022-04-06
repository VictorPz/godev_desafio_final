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
    
    lazy var iconImage: CustomIconImage = {
        let icon = CustomIconImage()
        return icon
    }()
    
    lazy var nameLabel: CustomTitleLabel = {
        let label = CustomTitleLabel()
        return label
    }()
    
    lazy var infoButton: CustomButton = {
        let button = CustomButton()
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
            iconImage.widthAnchor.constraint(equalToConstant: Metrics.Width.defaultWidthIcon),
            iconImage.heightAnchor.constraint(equalToConstant: Metrics.Height.defaultHeightIcon),
            nameLabel.widthAnchor.constraint(equalToConstant: 78)
        ])
    }
}
