//
//  githubApiService.swift
//  godev_projeto_final
//
//  Created by Victor Pizetta on 22/03/22.
//

import UIKit

class githubApiService: GithubServiceProtocol {
    
    static var shared: githubApiService {
        let apiInstance = githubApiService()
        return apiInstance
    }
    
    let session = URLSession.shared
    let baseUrl = "https://api.github.com/search/repositories?"
    
    func fetchList(for language: String, orderBy: Bool, _ completion: @escaping (Result<[Repo], responseError>) -> Void) {
        
        let search = "q="
        let comp = "language:\(language)&sort=stars&order=\(orderBy ? "desc" : "asc")&per_page=30"
        let queryUrl = "\(baseUrl)\(search)\(comp)"
        
        guard let url = URL(string: queryUrl) else {return completion(.failure(.urlInvalid))}
        
        let dataTask = session.dataTask(with: url) { data, _ , _ in
            
            do {
                guard let jsonData = data else { return completion(.failure(.noDataAvailable)) }
                
                let decoder = JSONDecoder()
                let repoResponse = try decoder.decode(ApiData.self, from: jsonData)
                completion(.success(repoResponse.items ?? []))
            } catch {
                completion(.failure(.noProcessData))
            }
        }
        dataTask.resume()
    }
}
