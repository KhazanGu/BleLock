//
//  ViewController.swift
//  LockClient
//
//  Created by Khazan on 2023/5/25.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func pairing(_ sender: UIButton) {
        
        center.scan()
        
    }
    
    
    let center = Center()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    

}

