//
//  HomeRequest.swift
//  godev_projeto_final
//
//  Created by Aloc SP11704 on 03/04/22.
//

import Foundation

enum HomeRequest: URLRequestProtocol {
    case home
    case detail
    
    var baseURL: String{
        return Environment.baseURL
    }
    
    var path: String {
        
        switch self {
            
        case .home:
//            let search = "q="
//            let comp = "language:\(language)&sort=stars&order=\(orderBy ? "desc" : "asc")&per_page=30"
//            let queryUrl = "\(baseUrl)\(search)\(comp)"
            return "desc=\(Environment.order)&sort=\(Environment.sort)&per_page=30&q=language:"
        case .detail:
            return "details=123"
        }
    }
    
    var methodHTTP: HTTPMethod {
        return .get
    }
    
}
