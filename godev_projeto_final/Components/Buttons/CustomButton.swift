//
//  CustomButton.swift
//  godev_projeto_final
//
//  Created by SP11793 on 05/04/22.
//

import UIKit

final class CustomButton: UIButton {
    
    init() {
        super.init(frame: .zero)
        configButton()
    }
    
    private func configButton() {
        translatesAutoresizingMaskIntoConstraints = false
        setTitleColor(.defaultButtonForegroundColor, for: .normal)
        backgroundColor = .defaultButtonBackgroundColor
        layer.cornerRadius = 6
    }
    
    public override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.1, delay: 0, options: [.beginFromCurrentState, .curveEaseOut]) { [self] in
                
                self.transform = self.isHighlighted ? .init(translationX: 0, y: 3) : .identity
            } completion: { _ in
                
            }
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
