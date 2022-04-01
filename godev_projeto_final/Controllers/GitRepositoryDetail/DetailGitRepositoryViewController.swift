//
//  DetailGitRepositoryViewController.swift
//  godev_projeto_final
//
//  Created by Idwall Go Dev 008 on 25/03/22.
//
import UIKit

class DetailGitRepositoryViewController: UIViewController {
    
    let detailGitRepository = DetailRepositoryView()
    public var infoRepo: GitHubRepo!
    
    override func loadView() {
        super.loadView()
        view = detailGitRepository
        detailGitRepository.setupInfoRepo(infoRepo: infoRepo)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = infoRepo.name
        configNavBar()
    }
    
    private func configNavBar() {
        if isFavorite() {
            let favorite = UIBarButtonItem(image: UIImage(systemName: "heart.fill"), style: .plain, target: self, action: #selector(removeFavorite))
            favorite.tintColor = .red
            navigationItem.rightBarButtonItem = favorite
        } else {
            let favorite = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(addFavorite))
            navigationItem.rightBarButtonItem = favorite
        }
    }
    
    @objc func addFavorite() {
        detailGitRepository.addFavoriteRepo(infoRepo: infoRepo)
        configNavBar()
    }
    
    @objc func removeFavorite() {
        confirmRemoveFavorite(infoRepo) { alert in
            self.detailGitRepository.removeFavoriteRepo(infoRepo: self.infoRepo)
            self.configNavBar()
        }
    }
    
    
    private func isFavorite() -> Bool {
        let repo = ManagedObjectContext.shared.getRepoData()
        
        if repo.firstIndex(where: {$0.id == infoRepo.id}) != nil {
            return true
        }
        
        return false
    }
    
    private func confirmRemoveFavorite(_ repo: GitHubRepo, handlerDelete: @escaping (UIAlertAction) -> Void) {

        let alert = UIAlertController(title: "Remover Favorito", message: "Deseja remover o repositório \(repo.name) dos favoritos?",
                                      preferredStyle: .alert)
        
        let removeButton = UIAlertAction(title: "Remover", style: .destructive, handler: handlerDelete)
        let cancelButton = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        alert.addAction(removeButton)
        alert.addAction(cancelButton)

        present(alert, animated: true, completion: nil)
    }
}
