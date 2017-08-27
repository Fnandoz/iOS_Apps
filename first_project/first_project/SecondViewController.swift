//
//  SecondViewController.swift
//  first_project
//
//  Created by Fernando Gomes on 19/08/17.
//  Copyright © 2017 Fernando Gomes. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var usrDefaults = UserDefaults.init()
    @IBOutlet weak var output: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.text = "Último valor salvo: \(usrDefaults.string(forKey: "greetings")!)"
        
    }
    
    @IBAction func changeImg(_ sender: Any) {
        if imgView.image == #imageLiteral(resourceName: "img1"){
            imgView.image = #imageLiteral(resourceName: "img2")
        }else{
            imgView.image = #imageLiteral(resourceName: "img1")
        }
    }
    
}
