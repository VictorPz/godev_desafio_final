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


// MARK: - Protocols

protocol managedReadProtocol {
    func getRepoData() -> [CoreDataRepo]
}

protocol managedSaveProtocol {
    func saveRepoData(repo: CoreDataRepo, onCompletionHandler: onCompletionHandler)
}

protocol managedDeleteProtocol {
    func deleteRepoData(id: String, onCompletionHandler: onCompletionHandler)
}


// MARK: - Class

class ManagedObjectContext:  managedReadProtocol, managedSaveProtocol, managedDeleteProtocol{
    
    
    // MARK: - Private Variables
    
    private let entity = "Entity"
    
    
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
    
    func getRepoData() -> [CoreDataRepo] {
        var repoList: [CoreDataRepo] = []
        
        do {
            
            let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entity)
            
            guard let repos = try getContext().fetch(fetchRequest) as? [NSManagedObject] else { return repoList}
            
            for repo in repos {
                
                if  let id = repo.value(forKey: "id") as? String,
                    let name = repo.value(forKey: "name") as? String,
                    let image = repo.value(forKey: "image") as? Data,
                    let details = repo.value(forKey: "details") as? String,
                    let author = repo.value(forKey: "author") as? String,
                    let viewsCount  = repo.value(forKey: "viewsCount") as? Int,
                    let createdAt = repo.value(forKey: "createdAt") as? String,
                    let license = repo.value(forKey: "license") as? String,
                    let url = repo.value(forKey: "url") as? String{
                    
                    let repo = CoreDataRepo(id: id, name: name, image: image, details: details, author: author, viewsCount: viewsCount, createdAt: createdAt, license: license, url: url)
                    repoList.append(repo)
                }
            }
        
        } catch let error as NSError {
            print("Error in request: \(error.localizedDescription)")
        }
        
        return repoList
    }
    
    func saveRepoData(repo: CoreDataRepo, onCompletionHandler: (String) -> Void) {
        let context = getContext()
        
        guard let entity = NSEntityDescription.entity(forEntityName: entity, in: context) else { return }
        
        let transaction = NSManagedObject(entity: entity, insertInto: context)
        
        transaction.setValue(repo.id, forKey: "id")
        transaction.setValue(repo.name, forKey: "name")
        transaction.setValue(repo.image, forKey: "image")
        transaction.setValue(repo.details, forKey: "details")
        transaction.setValue(repo.author, forKey: "author")
        transaction.setValue(repo.viewsCount, forKey: "viewsCount")
        transaction.setValue(repo.createdAt, forKey: "createdAt")
        transaction.setValue(repo.license, forKey: "license")
        transaction.setValue(repo.url, forKey: "url")
        
        do {
            try context.save()
            
            onCompletionHandler("Save success")
            
        } catch let error as NSError {
            print("Could not save \(error.localizedDescription)")
        }
    }
    
    func deleteRepoData(id: String, onCompletionHandler: (String) -> Void) {
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

/*
 // SAVE
let string = "2022-03-01T18:10:07Z"

let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
let dateString = dateFormatter.date(from: string)!

let image = UIImage(systemName: "square.and.arrow.up")?.pngData()

let repoTest = CoreDataRepo(id: "465005226", name: "TrafficLightsApp", image: image!, details: "homework  2.1 task 1", author: "StGeAr", viewsCount: 0, createdAt: "jo", license: "MIT", url: "https://api.github.com/repos/StGeAr/TrafficLightsApp")

ManagedObjectContext.shared.saveRepoData(repo: repoTest) { res in
    print(res)
}

// GET
var repoList: [CoreDataRepo] = []

repoList = ManagedObjectContext.shared.getRepoData()

print(repoList)

// DELETE
ManagedObjectContext.shared.deleteRepoData(id: "465005226") { res in
    print(res)
}
 */
