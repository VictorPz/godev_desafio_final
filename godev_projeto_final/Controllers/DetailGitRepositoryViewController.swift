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
        
    }
}
