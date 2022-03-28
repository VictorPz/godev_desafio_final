//
//  ApiData.swift
//  godev_projeto_final
//
//  Created by Rogério Tavares on 26/03/22.
//

import Foundation

struct ApiData: Codable {
    let total_count: Int?
    let incomplete_results: Bool?
    let items: [GitHubRepo]?
}
