//
//  ViewController.swift
//  SCNViewTest
//
//  Created by Christopher Hovey on 11/30/17.
//  Copyright © 2017 Chris Hovey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    
    @IBAction func toChariot(_ sender: AnyObject){
        if let vc = storyboard?.instantiateViewController(withIdentifier: "chariotSCNView") as? chariotSCNView{
            vc.isChariot = true
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func toPyramid(_ sender: AnyObject){
        if let vc = storyboard?.instantiateViewController(withIdentifier: "chariotSCNView") as? chariotSCNView{
            vc.isChariot = false
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

