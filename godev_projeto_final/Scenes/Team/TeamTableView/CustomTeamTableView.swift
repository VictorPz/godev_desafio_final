//
//  CustomTeamTableView.swift
//  godev_projeto_final
//
//  Created by Aloc SP11704 on 27/03/22.
//

import UIKit

final class CustomTeamTableView: UIView{
    
    //MARK: - Components
    
        lazy var tableView: CustomTableView = {
        let table = CustomTableView()
        table.register(CustomTeamTableViewCell.self, forCellReuseIdentifier: CustomTeamTableViewCell.identifier)
        table.dataSource = self
        return table
    }()
    
    //MARK: - Inicialization
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Extensions

extension CustomTeamTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Metrics.Height.defaultHeightForRowAt
    }
}

extension CustomTeamTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Team.populateData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: CustomTeamTableViewCell.identifier, for: indexPath) as? CustomTeamTableViewCell else { return UITableViewCell() }
        
        let listTeam = Team.populateData()
        let team = listTeam[indexPath.row]
        
        cell.updateView(team: team)
        return cell
    }
}

extension CustomTeamTableView: ViewCodable {
    
    func buildHierarchy() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate ([
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
