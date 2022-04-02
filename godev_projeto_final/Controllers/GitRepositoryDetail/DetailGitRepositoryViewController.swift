//
//  DetailGitRepositoryViewController.swift
//  godev_projeto_final
//
//  Created by Idwall Go Dev 008 on 25/03/22.
//

import UIKit

enum ScreenMode {
    case api
    case coredata
}

class DetailGitRepositoryViewController: UIViewController {
    
    let detailGitRepository = DetailRepositoryView()
    var infoRepo: GitHubRepo!
    
    let detailCoredataRepository = DetailCoreDataRepositoryView()
    var inforepoCoredata: CoreDataRepo!
    
    var screenMode: ScreenMode = .api
    
    override func loadView() {
        super.loadView()
        view = detailGitRepository
        initModeScreen()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTitle()
        initConfigNavBar()
    }
    
    
    private func initModeScreen() {
        switch screenMode {
        case .api:
            view = detailGitRepository
            detailGitRepository.setupInfoRepo(infoRepo: infoRepo)
        case .coredata:
            view = detailCoredataRepository
            detailCoredataRepository.setupInfoRepo(infoRepo: inforepoCoredata)
        }
    }
    
    private func initTitle() {
        switch screenMode {
        case .api:
            title = infoRepo.name
        case .coredata:
            title = inforepoCoredata.name
        }
    }
    
    private func initConfigNavBar() {
        switch screenMode {
        case .api:
            configApiNavBar()
        case .coredata:
            configCoredataNavBar()
        }
    }
    
    private func configApiNavBar() {
        if isFavorite() {
            let favorite = UIBarButtonItem(image: UIImage(systemName: "heart.fill"), style: .plain, target: self, action: #selector(removeApiFavorite))
            favorite.tintColor = .red
            navigationItem.rightBarButtonItem = favorite
        } else {
            let favorite = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(addApiFavorite))
            navigationItem.rightBarButtonItem = favorite
        }
    }
    
    @objc func addApiFavorite() {
        detailGitRepository.addFavoriteRepo(infoRepo: infoRepo)
        configApiNavBar()
    }
    
    @objc func removeApiFavorite() {
        confirmRemoveFavorite(infoRepo.name) { alert in
            self.detailGitRepository.removeFavoriteRepo(infoRepo: self.infoRepo)
            self.configApiNavBar()
        }
    }
    
    //------------------------------------
    
    private func configCoredataNavBar() {
        if isFavorite() {
            let favorite = UIBarButtonItem(image: UIImage(systemName: "heart.fill"), style: .plain, target: self, action: #selector(removeCoredataFavorite))
            favorite.tintColor = .red
            navigationItem.rightBarButtonItem = favorite
        } else {
            let favorite = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(addCoredataFavorite))
            navigationItem.rightBarButtonItem = favorite
        }
    }
    
    @objc func addCoredataFavorite() {
        detailCoredataRepository.addFavoriteRepo(infoRepo: inforepoCoredata)
        configCoredataNavBar()
    }
    
    @objc func removeCoredataFavorite() {
        confirmRemoveFavorite(inforepoCoredata.name) { alert in
            self.detailCoredataRepository.removeFavoriteRepo(infoRepo: self.inforepoCoredata)
            self.configCoredataNavBar()
        }
    }
    
    
    private func isFavorite() -> Bool {
        let repo = ManagedObjectContext.shared.getRepoData()
        
        if let infoRepo = infoRepo {
            if repo.firstIndex(where: {$0.id == infoRepo.id}) != nil {
                return true
            }
            
            return false
        }
        
        if repo.firstIndex(where: {$0.id == inforepoCoredata.id}) != nil {
            return true
        }
        
        return false
    }
    
    private func confirmRemoveFavorite(_ repoName: String, handlerDelete: @escaping (UIAlertAction) -> Void) {
        
        let alert = UIAlertController(title: "Remover Favorito", message: "Deseja remover o repositório \(repoName) dos favoritos?",
                                      preferredStyle: .alert)
        
        let removeButton = UIAlertAction(title: "Remover", style: .destructive, handler: handlerDelete)
        let cancelButton = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        alert.addAction(removeButton)
        alert.addAction(cancelButton)
        
        present(alert, animated: true, completion: nil)
    }
}
