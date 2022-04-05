//
//  CustomTableView.swift
//  godev_projeto_final
//
//  Created by SP11793 on 05/04/22.
//

import UIKit

final class CustomWarningLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configLabel()
    }
    
    private func configLabel() {
        translatesAutoresizingMaskIntoConstraints = false
        font = UIFont.systemFont(ofSize: 24, weight: .bold)
        textColor = .defaultWarningLabelColor
        numberOfLines = 0
        textAlignment = .center
        isHidden = true
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
