//
//  GithubViewModel.swift
//  godev_projeto_final
//
//  Created by Aloc SP11704 on 03/04/22.
//

import Foundation

class GithubViewModel {
    
    private var githubService: GithubListServiceProtocol
    
    weak var delegate: GithubViewModelDelegate?
    
    var github: ApiData?
    
    init(githubService: GithubListServiceProtocol){
        self.githubService = githubService
    }
    
    func fetchRepositoriesGithub() {
        githubService.execute { result in
            switch result {
            case .success(let git ):
                self.success(github: git)
            case .failure(let error):
                self.error(error: error.localizedDescription)
            }
        
        }
    }
    
    private func success(github: ApiData){
        self.github = github
        delegate?.githubFetchSuccess()
    }
    
    private func error(error: String){
        delegate?.errorToFetchGithub(error)
    }
    
}
