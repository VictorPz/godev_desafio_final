//
//  ManagedSaveProtocol.swift
//  godev_projeto_final
//
//  Created by SP11793 on 06/04/22.
//

import Foundation

protocol ManagedSaveProtocol {
    func saveRepoData(repo: Repo, onCompletionHandler: onCompletionHandler)
}
