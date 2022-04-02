//
//  CoreDataRepo.swift
//  godev_projeto_final
//
//  Created by KokumaiLuis on 25/03/22.
//

import Foundation

// struct that receives the CoreData repository information
/*struct CoreDataRepo {
    var id: Int
    var name: String
    var image: Data
    var details: String
    var author: String
    var viewsCount: Int
    var createdAt: String
    var license: String
    var url: String
}*/

struct CoreDataRepo: Codable {
    let id: Int
    let name: String // nome do repo
    let htmlUrl: String //url repo
    let description: String?
    let watchersCount: Int
    let createdAt: String
    let owner: CoreDataOwner
    let license: CoreDataLicense?
}

struct CoreDataOwner: Codable {
    let login: String// nome do owner
    let avatarImage: Data //img owner
}

struct CoreDataLicense: Codable {
    let name: String
}
