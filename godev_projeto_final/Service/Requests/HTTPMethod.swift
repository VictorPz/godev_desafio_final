//
//  HTTPMethod.swift
//  godev_projeto_final
//
//  Created by Aloc SP11704 on 03/04/22.
//

import Foundation

enum HTTPMethod: String {
    case get
    case post
    case delete
    case put
    case patch
    
    /// Return the name method in uppercased (GET, POST, ...)
    public var nameMethod: String {
        return rawValue.uppercased()
    }
    
}
