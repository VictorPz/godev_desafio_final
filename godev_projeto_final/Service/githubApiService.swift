//
//  githubApiService.swift
//  godev_projeto_final
//
//  Created by Victor Pizetta on 22/03/22.
//

import UIKit

enum responseError: Error {
    case urlInvalid
    case noProcessData
    case noDataAvailable
}

protocol ServiceProtocol {

    func fetchList(for language: String, orderBy: Bool, _ completion: @escaping (Result<[GitHubRepo], responseError>) -> Void)
}

class githubApiService: ServiceProtocol {
    
    static var shared: githubApiService {
        let apiInstance = githubApiService()
        return apiInstance
    }
    
    let session = URLSession.shared
    let baseUrl = "https://api.github.com/search/repositories?"
    
    func fetchList(for language: String, orderBy: Bool, _ completion: @escaping (Result<[GitHubRepo], responseError>) -> Void) {
        
        let search = "q="
        let comp = "language:\(language)&sort=stars&order=\(orderBy ? "desc" : "asc")&per_page=30"
        let queryUrl = "\(baseUrl)\(search)\(comp)"
        
        guard let url = URL(string: queryUrl) else {return completion(.failure(.urlInvalid))}
        
        let dataTask = session.dataTask(with: url) { data, _ , _ in
            
            do {
                guard let jsonData = data else { return completion(.failure(.noDataAvailable)) }
                
                let decoder = JSONDecoder()
                let userResponse = try decoder.decode(ApiData.self, from: jsonData)
                completion(.success(userResponse.items ?? []))
            } catch {
                completion(.failure(.noProcessData))
            }
        }
        dataTask.resume()
    }
}
