//
//  CustomTitleLabel.swift
//  godev_projeto_final
//
//  Created by SP11793 on 05/04/22.
//

import UIKit

final class CustomTitleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configLabel()
    }
    
    private func configLabel() {        
        translatesAutoresizingMaskIntoConstraints = false
        font = UIFont.systemFont(ofSize: 17)
        textColor = .defaultTitleLabelColor
        textAlignment = .left
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
