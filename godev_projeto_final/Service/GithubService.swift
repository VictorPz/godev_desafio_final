//
//  GithubService.swift
//  godev_projeto_final
//
//  Created by Aloc SP11704 on 03/04/22.
//

import Foundation

class GithubService: GithubListServiceProtocol {
    let session = URLSession.shared
    
    /// Method execute from protocol to consume API
    func execute(handler: @escaping (Result<ApiData, GitHubError>) -> Void) {
        let request: HomeRequest = .home
        
        if var baseURL = URLComponents(string: request.baseURL){
            baseURL.query = request.path
            
            guard let url = baseURL.url else { return }
            
            var requestURL: URLRequest = URLRequest(url: url)
            requestURL.httpMethod = request.methodHTTP.nameMethod
            
            let dataTask = session.dataTask(with: requestURL) { data, response, _ in
                
                guard let httpResponse = response as? HTTPURLResponse else { return }
                
                if httpResponse.statusCode == 200 {
                    do {
                        guard let jsonData = data else { return handler(.failure(.noProcessData))}
                        
                        let decoder = JSONDecoder()
                        
                        let responseData = try decoder.decode(ApiData.self, from: jsonData)
                        
                        handler(.success(responseData))
                        
                    } catch let error {
                        handler(.failure(.error(error.localizedDescription)))
                    }
                } else {
                    handler(.failure(.urlInvalid))
                }
            }
            dataTask.resume()
        }
    }
    
    
    
}
