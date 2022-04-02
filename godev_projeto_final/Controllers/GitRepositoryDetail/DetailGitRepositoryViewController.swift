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
        let favorite = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(addFavorite))
        navigationItem.rightBarButtonItem = favorite
    }
    
    @objc func addFavorite() {
        let favorite = UIBarButtonItem(image: UIImage(systemName: "heart.fill"), style: .plain, target: self, action: #selector(addFavorite))
        favorite.tintColor = .red
        navigationItem.rightBarButtonItem = favorite
        detailGitRepository.favoriteRepo(infoRepo: infoRepo)
    }
}
