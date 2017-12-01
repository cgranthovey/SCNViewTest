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
    
    var isChariot = false
    
    override func viewWillAppear(_ animated: Bool) {
        
        if isChariot{
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
        } else{
            let pyramid = SCNNode()
            pyramid.geometry = SCNPyramid(width: 1, height: 2, length: 1)
            pyramid.geometry?.firstMaterial?.diffuse.contents = UIColor.purple
            pyramid.geometry?.firstMaterial?.diffuse.contents = UIColor.white
            pyramid.position = SCNVector3(0, 0, 0)
            pyramid.eulerAngles = SCNVector3(x: 0, y: 10, z: 180 * Float.pi)
            let shapeScene = SCNScene()
            shapeScene.rootNode.addChildNode(pyramid)
            chariotView.scene = shapeScene
        }
        

    }
    
    @IBAction func backBtnPress(_ sender: AnyObject){
        self.navigationController?.popViewController(animated: true)
    }
    

}
