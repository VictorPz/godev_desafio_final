//
//  File.swift
//  godev_projeto_final
//
//  Created by Victor Pizetta on 22/03/22.
//

import Foundation

struct Repo: Codable {
    let id: Int
    let name: String // nome do repo
    let htmlURL: String //url repo
    let description: String?
    let watchersCount: Int
    let createdAt: String
    let owner: Owner
    let license: License?
    
    enum CodingKeys: String, CodingKey {
        case id,
             watchersCount = "watchers_count",
             name,
             htmlURL = "html_url",
             description,
             createdAt = "created_at",
             owner,
             license
    }
}

struct Owner: Codable {
    let login: String
    let avatarUrl: String //img owner
    let avatarImage: Data?
    
    enum CodingKeys: String, CodingKey {
        case login,
             avatarUrl = "avatar_url",
             avatarImage
    }
}

struct License: Codable {
    let name: String
}
