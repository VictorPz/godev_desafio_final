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
    var fone: String
    var email: String
    var linkedin: String
    
    
    init(name: String, ocupation: String, image: String, fone: String, email:String, linkedin:String) {
        self.name = name
        self.ocupation = ocupation
        self.image = image
        self.fone = fone
        self.email = email
        self.linkedin = linkedin
    }
    
    static func populateData() -> [Team]{
        let components:[Team] = [
            Team(name: "Carlos Henrique", ocupation: "Developer Mobile", image: "carlos", fone: "(84) 98715-0582", email: "carluxhenrique@gmail.com", linkedin: "https://www.linkedin.com/in/carlos-henrique-pires-dos-santos-23251a122/"),
            Team(name: "Carlos Henrique", ocupation: "Developer Mobile", image: "carlos", fone: "(84) 98715-0582", email: "carluxhenrique@gmail.com", linkedin: "https://www.linkedin.com/in/carlos-henrique-pires-dos-santos-23251a122/"),
            Team(name: "Carlos Henrique", ocupation: "Developer Mobile", image: "carlos", fone: "(84) 98715-0582", email: "carluxhenrique@gmail.com", linkedin: "https://www.linkedin.com/in/carlos-henrique-pires-dos-santos-23251a122/"),
            Team(name: "Carlos Henrique", ocupation: "Developer Mobile", image: "carlos", fone: "(84) 98715-0582", email: "carluxhenrique@gmail.com", linkedin: "https://www.linkedin.com/in/carlos-henrique-pires-dos-santos-23251a122/"),
            Team(name: "Carlos Henrique", ocupation: "Developer Mobile", image: "carlos", fone: "(84) 98715-0582", email: "carluxhenrique@gmail.com", linkedin: "https://www.linkedin.com/in/carlos-henrique-pires-dos-santos-23251a122/")]
        
        return components
    }
}
