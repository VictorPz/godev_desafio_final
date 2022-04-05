//
//  CustomVerticalStack.swift
//  godev_projeto_final
//
//  Created by SP11793 on 05/04/22.
//

import UIKit

final class CustomVerticalStackView: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configStack()
    }
    
    private func configStack() {
        translatesAutoresizingMaskIntoConstraints = false
        alignment = .fill
        contentMode = .top
        spacing = 8
        axis = .vertical
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
