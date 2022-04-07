//
//  ManagedObjectContext.swift
//  godev_projeto_final
//
//  Created by KokumaiLuis on 25/03/22.
//

import Foundation
import UIKit
import CoreData

// MARK: - Typealias

typealias onCompletionHandler = (String) -> Void

// MARK: - Class

class ManagedObjectContext:  ManagedReadProtocol, ManagedSaveProtocol, ManagedDeleteProtocol{
    
    // MARK: - Private Variables
    
    private let entity = "Repositories"
    
    // MARK: - Public Properties
    
    static var shared: ManagedObjectContext = {
        let instance = ManagedObjectContext()
        return instance
    }()
        
    // MARK: - Public Methods
    
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func getRepoData() -> [Repo] {
        var repoList: [Repo] = []
        
        do {
            let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entity)
            
            guard let repos = try getContext().fetch(fetchRequest) as? [NSManagedObject] else { return repoList }
            
            for repo in repos {
                if  let id = repo.value(forKey: "id") as? Int,
                    let name = repo.value(forKey: "name") as? String,
                    let avatarImage = repo.value(forKey: "image") as? Data,
                    let description = repo.value(forKey: "details") as? String,
                    let login = repo.value(forKey: "author") as? String,
                    let imageUrl = repo.value(forKey: "imageURL") as? String,
                    let watchersCount  = repo.value(forKey: "viewsCount") as? Int,
                    let createdAt = repo.value(forKey: "createdAt") as? String,
                    let license = repo.value(forKey: "license") as? String,
                    let htmlUrl = repo.value(forKey: "url") as? String{
                    
                    let owner = Owner(login: login, avatarUrl: imageUrl, avatarImage: avatarImage)
                    let license = License(name: license)
                    
                    let repo = Repo(id: id, name: name, htmlURL: htmlUrl, description: description, watchersCount: watchersCount, createdAt: createdAt, owner: owner, license: license)
                    
                    repoList.append(repo)
                }
            }
        
        } catch let error as NSError {
            print("Error in request: \(error.localizedDescription)")
        }
        
        return repoList
    }
    
    func saveRepoData(repo: Repo, onCompletionHandler: (String) -> Void) {
        let context = getContext()
        
        guard let entity = NSEntityDescription.entity(forEntityName: entity, in: context) else { return }
        
        let transaction = NSManagedObject(entity: entity, insertInto: context)
        
        transaction.setValue(repo.id, forKey: "id")
        transaction.setValue(repo.name, forKey: "name")
        transaction.setValue(repo.owner.avatarImage, forKey: "image")
        transaction.setValue(repo.owner.avatarUrl, forKey: "imageURL")
        transaction.setValue(repo.description, forKey: "details")
        transaction.setValue(repo.owner.login, forKey: "author")
        transaction.setValue(repo.watchersCount, forKey: "viewsCount")
        transaction.setValue(repo.createdAt, forKey: "createdAt")
        transaction.setValue(repo.license?.name, forKey: "license")
        transaction.setValue(repo.htmlURL, forKey: "url")
        
        do {
            try context.save()
            
            onCompletionHandler("Save success")
            
        } catch let error as NSError {
            print("Could not save \(error.localizedDescription)")
        }
    }
    
    func deleteRepoData(id: Int, onCompletionHandler: (String) -> Void) {
        let context = getContext()
        
        let predicate = NSPredicate(format: "id == %@", "\(id)")
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entity)
        fetchRequest.predicate = predicate
        
        do {
            
            let fetchResults = try context.fetch(fetchRequest) as! [NSManagedObject]
            
            if let entityDelete = fetchResults.first {
                context.delete(entityDelete)
            }
            
            try context.save()
            
            onCompletionHandler("Delete Success")
            
        } catch let error as NSError {
            print("Fatch failed \(error.localizedDescription)")
        }
    }
}
