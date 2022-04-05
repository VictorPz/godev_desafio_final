//
//  CustomTableView.swift
//  godev_projeto_final
//
//  Created by SP11793 on 05/04/22.
//

import UIKit

class CustomTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        configTableView()
    }
    
    private func configTableView() {
        translatesAutoresizingMaskIntoConstraints = false
        separatorColor = .defaultTableViewSeparatorColor
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
