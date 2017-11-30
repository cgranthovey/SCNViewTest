//
//  chariotSCNView.swift
//  SCNViewTest
//
//  Created by Christopher Hovey on 11/30/17.
//  Copyright © 2017 Chris Hovey. All rights reserved.
//

import UIKit
import SceneKit

class chariotSCNView: UIViewController {

    @IBOutlet weak var chariotView: SCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chariotView.autoenablesDefaultLighting = true
        chariotView.allowsCameraControl = true
        chariotView.backgroundColor = UIColor.black
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let urlpath = Bundle.main.path(forResource: "chariot", ofType: "obj"){
            let url = URL(fileURLWithPath: urlpath)
            do{
                var myScene = SCNScene()
                myScene = try SCNScene(url: url, options: [:])
                let sceneNode = myScene.rootNode.childNodes[0]
                sceneNode.geometry?.firstMaterial?.isDoubleSided = true
                chariotView.scene = myScene
                
            } catch{
            }
        }
        
    }
    
    @IBAction func backBtnPress(_ sender: AnyObject){
        self.navigationController?.popViewController(animated: true)
        //dismiss(animated: true, completion: nil)
    }
    

}
