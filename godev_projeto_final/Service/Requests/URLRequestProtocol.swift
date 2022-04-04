//
//  URLRequestProtocol.swift
//  godev_projeto_final
//
//  Created by Aloc SP11704 on 03/04/22.
//

import Foundation

protocol URLRequestProtocol {
    
    /// API base url
    var baseURL: String { get }
    /// Define the endpoint we want get
    var path: String { get }
    /// Show method http that we want use
    var methodHTTP: HTTPMethod { get }
}
