//
//  ServiceProtocol.swift
//  godev_projeto_final
//
//  Created by SP11793 on 06/04/22.
//

import Foundation

enum responseError: Error {
    case urlInvalid
    case noProcessData
    case noDataAvailable
}

protocol GithubServiceProtocol {

    func fetchList(for language: String, orderBy: Bool, _ completion: @escaping (Result<[Repo], responseError>) -> Void)
}
