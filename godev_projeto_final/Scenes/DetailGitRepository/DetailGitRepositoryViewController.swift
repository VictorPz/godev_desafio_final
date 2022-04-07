//
//  DetailGitRepositoryViewController.swift
//  godev_projeto_final
//
//  Created by Idwall Go Dev 008 on 25/03/22.
//

import UIKit
import SafariServices

final class DetailGitRepositoryViewController: UIViewController {
    
    let detailGitRepository = DetailRepositoryView()
    var infoRepo: Repo?
    
    //MARK: - Life Cycle
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        configApiNavBar()
    }
    
    //MARK: - Methods
    
    private func initModeScreen() {
        view = detailGitRepository
        
        guard let infoRepo = infoRepo else { return }
        
        detailGitRepository.setupInfoRepo(infoRepo: infoRepo)
        detailGitRepository.delegate = self
    }
    
    private func initTitle() {
        title = infoRepo?.name
    }
    
    private func initConfigNavBar() {
        configApiNavBar()
    }
    
    private func configApiNavBar() {
        if isFavorite() {
            let favorite = UIBarButtonItem(image: UIImage(systemName: "heart.fill"), style: .plain, target: self, action: #selector(removeApiFavorite))
            favorite.tintColor = .defaultTintColor
            navigationItem.rightBarButtonItem = favorite
        } else {
            let favorite = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(addApiFavorite))
            navigationItem.rightBarButtonItem = favorite
        }
    }
    
    @objc func addApiFavorite() {
        guard let infoRepo = infoRepo else {
            return
        }

        detailGitRepository.addFavoriteRepo(infoRepo: infoRepo)
        configApiNavBar()
    }
    
    @objc func removeApiFavorite() {
        guard let infoRepo = infoRepo else {
            return
        }
        
        confirmRemoveFavorite(infoRepo.name) { alert in
            self.detailGitRepository.removeFavoriteRepo(infoRepo: infoRepo)
            self.configApiNavBar()
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

//MARK: - Extensions

extension DetailGitRepositoryViewController: DetailRepositoryViewDelegate {
    func detailButtonPressedGithub(_ value: String) {
        guard let url = URL(string: value) else { return }
        
        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = true
        
        let safariViewController = SFSafariViewController(url: url, configuration: config)
        safariViewController.delegate = self
        safariViewController.dismissButtonStyle = .close
        safariViewController.preferredBarTintColor = .defaultBackgroundColor
        safariViewController.preferredControlTintColor = .defaultTintColor
        
        present(safariViewController, animated: true)
    }
}

extension DetailGitRepositoryViewController: SFSafariViewControllerDelegate {
    
}
