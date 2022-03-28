//
//  CustomLabel.swift
//  godev_projeto_final
//
//  Created by Idwall Go Dev 008 on 27/03/22.
//

import UIKit

class CustomLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configLabel()
    }
    
    private func configLabel() {
        translatesAutoresizingMaskIntoConstraints = false
        textColor = .label
        numberOfLines = 0
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
