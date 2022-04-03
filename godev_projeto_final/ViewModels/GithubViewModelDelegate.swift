//
//  GithubViewModelDelegate.swift
//  godev_projeto_final
//
//  Created by Aloc SP11704 on 03/04/22.
//

import Foundation

protocol GithubViewModelDelegate: AnyObject {
    
    func githubFetchSuccess()
    func errorToFetchGithub(_ error: String)
    
}
