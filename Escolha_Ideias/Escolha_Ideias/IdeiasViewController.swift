//
//  IdeiasTableViewController.swift
//  Escolha_Ideias
//
//  Created by Fernando Gomes on 23/08/17.
//  Copyright © 2017 Fernando Gomes. All rights reserved.
//

import UIKit
import FirebaseDatabase

class IdeiasViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var lista: UITableView!
    
    var ref: DatabaseReference!
    
    var titulos: [String] = []
    var descricoes: [String] = []
    var keys: [String] = []
    var votos: [Int] = []
    
    var ideiasList: [Ideia] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.lista.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        lista.delegate = self
        lista.dataSource = self
        
        ref = Database.database().reference()
    
        self.loadData()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ideiasList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = self.lista.dequeueReusableCell(withIdentifier: "cell") as UITableViewCell!
        
        // set the text from the data model
        cell.textLabel?.text = self.ideiasList[indexPath.row].titulo
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alert = UIAlertController(
            title: ideiasList[indexPath.row].titulo,
            message: ideiasList[indexPath.row].descricao,
            preferredStyle: .alert
        )
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel) { (action:UIAlertAction!) in
        }
        
        alert.addAction(cancelAction)
        
        let votoPositivoAction = UIAlertAction(title: "+1", style: .default) { (action:UIAlertAction!) in

            let ideiaUpdate = self.ideiasList[indexPath.row]
            ideiaUpdate.votos = ideiaUpdate.votos!+1
            
            let ideia_update = [
                "id": ideiaUpdate.id!,
                "titulo": ideiaUpdate.titulo!,
                "descricao": ideiaUpdate.descricao!,
                "votos": ideiaUpdate.votos!
            ] as [String : Any]
            
            self.ref.child("ideias").child(self.ideiasList[indexPath.row].id!).setValue(ideia_update)
            
            
        }
        
        
        alert.addAction(votoPositivoAction)
        
        self.present(alert, animated: true, completion:nil)
    }
    
    func loadData() -> Void {
        ref.child("ideias").observe(.value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            
            for i in (value?.allKeys)!{
                self.keys.append(i as! String)
            }
            
            //print("\(self.keys), \(self.keys.count)")
            
            var index:Int = 0
            while index < self.keys.count{
                
                let listaIdeias = value?.allValues[index] as! NSDictionary
                
                //print("Index: \(index)|| titulo \(listaIdeias["titulo"]! as! String) || descricao \(listaIdeias["descricao"]! as! String) || Votos \(listaIdeias["votos"] as! Int)")
                
                let i: Ideia = Ideia.init(
                    i: listaIdeias["id"]! as! String,
                    t: listaIdeias["titulo"]! as! String,
                    d: listaIdeias["descricao"]! as! String,
                    v: listaIdeias["votos"]! as! Int)
                
                self.ideiasList.append(i)
                
                index+=1
                
            }
            print(self.ideiasList)
            self.lista.reloadData()
            
        }) { (error) in
            print(error)
        }
    }
    
}

