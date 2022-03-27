//
//  Team.swift
//  godev_projeto_final
//
//  Created by Aloc SP11704 on 27/03/22.
//

import UIKit

struct Team {
    var name: String
    var ocupation: String
    var image: String
    
    init(name: String, ocupation: String, image: String) {
        self.name = name
        self.ocupation = ocupation
        self.image = image
    }
    
    static func populateData() -> [Team]{
        let components:[Team] = [
            Team(name: "Carlos Henrique", ocupation: "Developer Mobile", image: "carlos"),
            Team(name: "Carlos Henrique", ocupation: "Developer Mobile", image: "carlos"),
            Team(name: "Carlos Henrique", ocupation: "Developer Mobile", image: "carlos"),
            Team(name: "Carlos Henrique", ocupation: "Developer Mobile", image: "carlos"),
            Team(name: "Carlos Henrique", ocupation: "Developer Mobile", image: "carlos")]
        
        return components
    }
}
