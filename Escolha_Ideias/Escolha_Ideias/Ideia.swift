//
//  Ideia.swift
//  Escolha_Ideias
//
//  Created by Fernando Gomes on 22/08/17.
//  Copyright © 2017 Fernando Gomes. All rights reserved.
//

import Foundation

//https://firebase.google.com/docs/database/ios/start?hl=pt-br
//https://guides.cocoapods.org/using/using-cocoapods.html
class Ideia {
    var id: String?
    var titulo: String?
    var descricao: String?
    var votos: Int?
    
    
    
    init(i:String, t: String, d:String, v: Int) {
        self.id = i
        self.titulo = t
        self.descricao = d
        self.votos = v
    }
    
    
    init(t: String, d:String, v: Int) {
        self.titulo = t
        self.descricao = d
        self.votos = v
    }
    
    func salvar() -> Void {
        print("Salvo")
    }
}
