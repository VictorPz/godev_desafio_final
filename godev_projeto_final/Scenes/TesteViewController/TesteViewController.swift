//
//  TesteViewController.swift
//  godev_projeto_final
//
//  Created by Aloc SP11704 on 03/04/22.
//

import UIKit

class TesteViewController: UIViewController {
    // mudancas carlos
    var viewModel: GithubViewModel?
    
    private enum ViewState {
        case loading
        case normal
        case error
    }
    private var status: ViewState = .normal {
        didSet{
            self.setupView()
        }
    }
    
    func setupView(){
        switch status {
        case .loading:
            print("loading")
        case .normal:
            print("normal")
            print(viewModel?.github?.items?[0].name ?? "Vazio")
        case .error:
            print("error")
        }
    }
    
    
  
    
    private func fetchGithub(){
        viewModel?.fetchRepositoriesGithub(language: "swift")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewModel?.delegate = self
        status = .loading
        fetchGithub()
    }
}


// mudancas carlos
extension TesteViewController: GithubViewModelDelegate {
    
    func githubFetchSuccess() {
        status = .normal
    }
    
    func errorToFetchGithub(_ error: String) {
        print("error")
        status = .error
    }
    
}
