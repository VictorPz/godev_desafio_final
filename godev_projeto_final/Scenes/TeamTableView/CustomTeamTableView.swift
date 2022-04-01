//
//  CustomTeamTableView.swift
//  godev_projeto_final
//
//  Created by Aloc SP11704 on 27/03/22.
//

import UIKit

class CustomTeamTableView: UIView{
    
    private lazy var tableview: UITableView = {
        let table = UITableView()
        
        table.register(CustomTableViewCellTeam.self, forCellReuseIdentifier: CustomTableViewCellTeam.identifier)
        
        table.delegate = self
        table.dataSource = self
        table.showsVerticalScrollIndicator = false
        table.separatorColor = UIColor.clear
        
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomTeamTableView: UITableViewDelegate {
    
    
}

extension CustomTeamTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Team.populateData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCellTeam.identifier, for: indexPath) as? CustomTableViewCellTeam else { return UITableViewCell() }
        
        let listTeam = Team.populateData()
        let team = listTeam[indexPath.row]
        
        cell.updateView(team: team)
        return cell
    }
}

extension CustomTeamTableView: ViewCodable {
    
    func buildHierarchy() {
        addSubview(tableview)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate ([
            tableview.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableview.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableview.topAnchor.constraint(equalTo: topAnchor),
            tableview.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}