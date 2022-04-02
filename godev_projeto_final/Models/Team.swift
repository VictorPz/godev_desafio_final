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
    var description: String
    var github: String
    
    
    init(name: String, ocupation: String, image: String, fone: String, email:String, linkedin:String, github: String, description: String) {
        self.name = name
        self.ocupation = ocupation
        self.image = image
        self.fone = fone
        self.email = email
        self.linkedin = linkedin
        self.github = github
        self.description = description
        
    }
    
    static func populateData() -> [Team] {
        let components:[Team] = [
            Team(name: "Carlos Henrique",
                 ocupation: "Analista de Sistema Pleno (Midway Financeira)",
                 image: "carlos",
                 fone: "(84) 98715-0582",
                 email: "carluxhenrique@gmail.com",
                 linkedin: "https://www.linkedin.com/in/carlos-henrique-pires-dos-santos-23251a122/",
                 github: "https://github.com/carlosHenriquePires",
                 description: "Apaixonado por tecnologia e jogos, adoro praticar esportes, para mim missão dada é missão cumprida, quanto mais desafiador e inovador melhor. Costumo sempre compartilhar conhecimento, ajudar e ser ajudado, é por isso que nossa comunidade está crescendo tanto. Tenho curtido muito trabalhar em equipe, com todos contribuindo e se ajudando as tarefas sempre são concluídas."),
            
            Team(name: "João Victor Trajane Pizetta",
                 ocupation: "Estudante",
                 image: "joaovictor",
                 fone: "(28) 99984-9691",
                 email: "joao.victor07.br2@gmail.com",
                 linkedin: "https://www.linkedin.com/in/jvictor-pizetta/",
                 github: "https://github.com/VictorPz",
                 description: "Sou um amante de desafios, tecnologia e games. Curto muito trabalhar em equipe e estar inserido em grupos com diversidade de opiniões, ideias e conhecimentos! Acredito que só assim posso estar sempre aprendendo coisas novas e transmitindo o que conheço. Sou formado em Direito e já estou ansioso pela próxima graduação dentro da área de tecnologia."),
            
            Team(name: "Jonas William",
                 ocupation: "Developer Mobile",
                 image: "carlos", fone: "(84) 98715-0582",
                 email: "carluxhenrique@gmail.com",
                 linkedin: "https://www.linkedin.com/in/carlos-henrique-pires-dos-santos-23251a122/",
                 github: "",
                 description: ""),
            
            Team(name: "Luis Kokumai",
                 ocupation: "Developer Mobile",
                 image: "carlos", fone: "(84) 98715-0582",
                 email: "carluxhenrique@gmail.com",
                 linkedin: "https://www.linkedin.com/in/carlos-henrique-pires-dos-santos-23251a122/",
                 github: "",
                 description: ""),
            
            Team(name: "Rafael Rocha dos Santos",
                 ocupation: "Técnico de Tecnologia da Informação - IFTM - Patrocínio",
                 image: "rafa",
                 fone: "(34) 99226-9887",
                 email: "rafaelsantoscv_@hotmail.com / rafaelrocha578@gmail.com",
                 linkedin: "https://www.linkedin.com/in/rafael-rocha-dos-santos-7b133410b",
                 github: "https://github.com/santosfael",
                 description: "Fascinado por tecnologia e o mundo do hardware. Sou um cara que gosta de novos desafios, gosto de fazer amizade, conversar é sempre bom. Curto mecânica automotiva, curto a cultura otako, fascinado por filmes de ficção científica e também filmes de super heróis, não deve faltar! não sou bom em passar os meus conhecimentos, mas sempre faço o possível pra está ajudando, pois se eu aprendi, posso aprender mais ainda ensinando."),
            
            Team(name: "Rogério Tavares",
                 ocupation: "Developer Mobile",
                 image: "carlos", fone: "(84) 98715-0582",
                 email: "carluxhenrique@gmail.com",
                 linkedin: "https://www.linkedin.com/in/carlos-henrique-pires-dos-santos-23251a122/",
                 github: "",
                 description: "")]
        
        return components
    }
}
