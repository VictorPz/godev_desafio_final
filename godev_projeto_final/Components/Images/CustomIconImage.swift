//
//  CustomIconImage.swift
//  godev_projeto_final
//
//  Created by Victor Pizetta on 01/04/22.
//

import UIKit

final class CustomIconImage: UIImageView {
    
    init() {
        super.init(frame: .zero)
        configImage()
    }
    
    private func configImage() {
        translatesAutoresizingMaskIntoConstraints = false
        contentMode = .scaleAspectFill
        tintColor = .defaultIconTintColor
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
