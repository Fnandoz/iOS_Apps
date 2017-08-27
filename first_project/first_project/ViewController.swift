//
//  ViewController.swift
//  first_project
//
//  Created by Fernando Gomes on 19/08/17.
//  Copyright © 2017 Fernando Gomes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var intxt: UITextField!
    @IBOutlet weak var txtview: UITextView!
    
    @IBOutlet var tapGesture: UITapGestureRecognizer!
    @IBOutlet var pinchGesture: UIPinchGestureRecognizer!
    
    var a = ["Olá mundo!", "Olá, senhor.", "Falae!"]
    var usrDefaults = UserDefaults.init()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addGestureRecognizer(tapGesture)
        tapGesture.numberOfTapsRequired = 2
        self.view.addGestureRecognizer(pinchGesture)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Func botao 1
    @IBAction func btn1(_ sender: Any) {
        self.txtview.text = a[0]
    }

    
    // Func botao 2
    @IBAction func btn2(_ sender: Any) {
        self.txtview.text = a[1]
    }
    
    
    // Func botao 3
    @IBAction func btn3(_ sender: Any) {
        self.txtview.text = a[2]
    }
    
    // Func botao salvar
    @IBAction func save(_ sender: Any) {
        if self.intxt.text != ""{
            usrDefaults.setValue(self.intxt.text, forKey: "greetings")
            a.append(self.intxt.text!)
            self.txtview.text = "Salvo \(self.intxt.text ?? "")"
            intxt.text = ""
        }
        
    }
    
    // Func tapGesture
    @IBAction func tapGesture(_ sender: Any) {
        print("Tap")
    }
    
    @IBAction func pinchGesture(_ sender: Any) {
        print("Pinch")
    }
}

