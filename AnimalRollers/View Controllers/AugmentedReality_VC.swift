//
//  AugmentedReality_VC.swift
//  AnimalRollers
//
//  Created by Dylan McCowan on 2018-03-28.
//  Copyright © 2018 GreyCodeGroup. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

//Include the ARSCNViewDelegate to handle the rendering options
class AugmentedReality_VC: UIViewController, ARSCNViewDelegate{

    //This variable is for the AR Scene View, which will allow the AR content to be displayed on it
    @IBOutlet var scnView : ARSCNView!

    //THe name of the desired node from the pig SceneKit file containing the pig model
    let nodeName = "pig"
    
    func setUpSceneView() {
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
    
        scnView.delegate = self
        scnView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        
        scnView.session.run(configuration)
    }
    
    func configureLighting() {
        scnView.autoenablesDefaultLighting = true
        scnView.automaticallyUpdatesLighting = true
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureLighting()
        addTapGuesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpSceneView()
    }
    
    @objc func addPigToScene(withGuestureRecognizer recognizer : UIGestureRecognizer)
    {
        let tapLocation = recognizer.location(in: scnView)
        let hitTestResults = scnView.hitTest(tapLocation, types: .existingPlaneUsingExtent)
        
        guard let hitTestResult = hitTestResults.first else {return}
        let translation = hitTestResult.worldTransform.translation
        let x = translation.x
        let y = translation.y
        let z = translation.z
        
        
        guard let pigScene = SCNScene(named: "pig.scn"), let pigNode = pigScene.rootNode.childNode(withName: "pig", recursively: false) else { return }
        
        pigNode.position = SCNVector3(x,y,z)
        scnView.scene.rootNode.addChildNode(pigNode)
    }
    
    @objc func addTapGuesture()
    {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(AugmentedReality_VC.addPigToScene(withGuestureRecognizer:)))
        scnView.addGestureRecognizer(tapGestureRecognizer)
        
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Start the Augmented Reality Session
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        /*
         World Tracking Configuration:
         This allows the device to track horizontal planes, which is required to place our animal down on
        */
        let trackingConfiguration = ARWorldTrackingConfiguration()
        
        //Set the configuration to track the horizontal plane
        trackingConfiguration.planeDetection = .horizontal
        
        //Set out AR Scene object to use our World Trackign configuration and run with it
         scnView.session.run(trackingConfiguration)
        
    }
    
    //MARK: - ARSCNViewDelegate Methods
    
    //This delegate method is responsible for placing content
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        
        //First, discover and use a horizontal plane anchor
        guard let planeAnchor = anchor as? ARPlaneAnchor else {return}
        
        //SceneKit plane - This is used to visualize the plane anchor using its position and extend values
        let plane = SCNPlane(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z))
        
         plane.materials.first?.diffuse.contents = UIColor.transparentLightBrown
        
        //SceneKit plane node - This is a node represents a space on the scene
        // -- This is what will be used to attach object geometry to display the models
        let planeNode = SCNNode(geometry: plane)
        
        let x = CGFloat(planeAnchor.center.x)
        let y = CGFloat(planeAnchor.center.y)
        let z = CGFloat(planeAnchor.center.z)
        planeNode.position = SCNVector3(x,y,z)
        planeNode.eulerAngles.x = -.pi / 2
        
        node.addChildNode(planeNode)
        
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard let planeAnchor = anchor as? ARPlaneAnchor, let planeNode = node.childNodes.first, let plane = planeNode.geometry as? SCNPlane else {return}
        
        let width = CGFloat(planeAnchor.extent.x)
        let height = CGFloat(planeAnchor.extent.z)
        plane.width = width
        plane.height = height
        
        let x = CGFloat(planeAnchor.center.x)
        let y = CGFloat(planeAnchor.center.y)
        let z = CGFloat(planeAnchor.center.z)
        
        planeNode.position = SCNVector3(x,y,z)
        
    }

    //MARK: - Pause The Augmented Reality Session
    override func viewWillDisappear(_ animated: Bool) {
        //if the view is going to disappear, we have to pause the session to not waste resources
        scnView.session.pause()
    }
    
}

extension float4x4 {
    var translation: float3 {
        let translation = self.columns.3
        return float3(translation.x, translation.y, translation.z)
    }
}

extension UIColor {
    open class var transparentLightBrown: UIColor {
        return UIColor(red: 204/255, green: 153/255, blue: 102/255, alpha: 0.50)
    }
}
