//
//  File.swift
//  godev_projeto_final
//
//  Created by Victor Pizetta on 22/03/22.
//

import Foundation

struct GitHubRepo: Codable {
    let id: Int
    let node_id: String
    let name: String // nome do repo
    let full_name: String //nome do repo + usuario (vsouza/awesome-ios)
    let html_url: String //url repo
    let description: String?
    let watchers_count: Int
    let created_at: String
    let owner: Owner
    let license: License?
}

struct Owner: Codable {
    let login: String// nome do owner
    let id: Int
    let node_id: String
    let avatar_url: String //img owner
}

struct License: Codable {
    let name: String
}
