//
//  UIStackView+extensions.swift
//  godev_projeto_final
//
//  Created by Idwall Go Dev 008 on 27/03/22.
//

import UIKit

extension UIStackView {
    
    public func addArrangedSubviews(_ subView: UIView...) {
        subView.forEach(addArrangedSubview)
    }
}
