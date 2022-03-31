//
//  Date+extensions.swift
//  godev_projeto_final
//
//  Created by SP11793 on 31/03/22.
//

import Foundation

extension String {
    public func convertStringDateFormat(stringVariable: String) -> String {
        let inDateFormatter = DateFormatter()
        inDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let inDateVariable = inDateFormatter.date(from: stringVariable)
        
        let outDateFormatter = DateFormatter()
        outDateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        let outStringVariable = outDateFormatter.string(from: inDateVariable!)
        
        return outStringVariable
    }
}
