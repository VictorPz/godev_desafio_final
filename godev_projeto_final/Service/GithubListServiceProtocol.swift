//
//  GithubListServiceProtocol.swift
//  godev_projeto_final
//
//  Created by Aloc SP11704 on 03/04/22.
//

import Foundation

enum GitHubError: Error {
    case error(String)
    case urlInvalid
    case noDataAvailable
    case noProcessData
}

protocol GithubListServiceProtocol: AnyObject {
    
    func execute(handler: @escaping(Result<ApiData,GitHubError>) -> Void)
    
}
