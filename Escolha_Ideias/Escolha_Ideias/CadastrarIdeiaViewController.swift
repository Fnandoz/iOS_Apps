//
//  CadastrarIdeiaViewController.swift
//  Escolha_Ideias
//
//  Created by Fernando Gomes on 22/08/17.
//  Copyright © 2017 Fernando Gomes. All rights reserved.
//

import UIKit
import FirebaseDatabase

class CadastrarIdeiaViewController: UIViewController {
    
    @IBOutlet weak var tituloTextField: UITextField!
    @IBOutlet weak var descricaoTextView: UITextView!
    var ref: DatabaseReference!
    
    
    override func viewDidAppear(_ animated: Bool) {
        ref = Database.database().reference()

        
    }
    
    @IBAction func salvarButton(_ sender: Any) {
        let ideia = Ideia(t: tituloTextField.text!, d: descricaoTextView.text, v: 0)
        
        print(ideia.titulo!)
        print(ideia.descricao!)
        self.ref.child("ideias").childByAutoId().setValue(["titulo": ideia.titulo, "descricao": ideia.descricao, "votos": 0])
        navigationController?.popViewController(animated: true)
        
    }
    
    

}
