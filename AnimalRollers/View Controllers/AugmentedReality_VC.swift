//
//  AugmentedReality_VC.swift
//  AnimalRollers
//
//  Created by Dylan McCowan on 2018-03-28.
//  Copyright © 2018 GreyCodeGroup. All rights reserved.
//
//  This file is the view controller to handle all of the AR related functionality found in Animal Rollers
//
//

import UIKit
import SceneKit
import ARKit

//Include the ARSCNViewDelegate to handle the rendering options
class AugmentedReality_VC: UIViewController, ARSCNViewDelegate{

    //This variable is for the AR Scene View, which will allow the AR content to be displayed on it
    @IBOutlet var scnView : ARSCNView!
    
    //This back button allows the user to exit the AR View mode and return to the main screen
    @IBOutlet var btnBack : UIButton!

    //The name of the desired node from the pig SceneKit file containing the pig model
    let nodeName = "pig"
    
    //Allow the sceneview to automatically configure the lighting for the model using physically-based lighting found in the world
    func configureLighting() {
        scnView.autoenablesDefaultLighting = true
        scnView.automaticallyUpdatesLighting = true
    }
    
    //Ensure our lighting configuration is set and also add a guesture recognizer to look for taps
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureLighting()
        addTapGuesture()
    }
   
    //This method is responsible for understanding where the user tapped on the screen, if its a valid plane based on the touch location, then add a pig model
    @objc func addPigToScene(withGuestureRecognizer recognizer : UIGestureRecognizer)
    {
        //Get the location of the tap from the scene view
        let tapLocation = recognizer.location(in: scnView)
        
        //Check that the hit location is on a valid existing AR plane anchor
        let hitTestResults = scnView.hitTest(tapLocation, types: .existingPlaneUsingExtent)
        
        //Ensure that the hit tap result we are testing is the first one the screen recieved
        guard let hitTestResult = hitTestResults.first else {return}
        //Create a translation to get a xyz value of where the tap occured
        let translation = hitTestResult.worldTransform.translation
        let x = translation.x
        let y = translation.y
        let z = translation.z
        
        
        //Create a pigScene object based on the ARAsset pig.scn with the node of the model pig, this node is what will be added to the screen to the user's view
        guard let pigScene = SCNScene(named: "pig.scn"), let pigNode = pigScene.rootNode.childNode(withName: "pig", recursively: false) else { return }
        
        //Set the pig model to the tapped coordinates
        pigNode.position = SCNVector3(x,y,z)
        
        //Add the new model to the AR scene view as a child node
        scnView.scene.rootNode.addChildNode(pigNode)
    }
    
    //Function quickly allows the ability for taps to be gathered and added to this view contoller.
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
        
        //Assign the scenview to have itself (object) as the source of the delegate
        scnView.delegate = self
        
        //Set the configuration to track the horizontal plane
        trackingConfiguration.planeDetection = .horizontal
        
        //We want to show feature points to help show the user where the plane detection is having good results, since it is difficult in some situations for the computer to detect a suitable flat surface
        scnView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]

        
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
        
        //Set a custom colour defined in the extension at the bottom of the file to somehting similar to a dirt surface
         plane.materials.first?.diffuse.contents = UIColor.transparentLightBrown
        
        //SceneKit plane node - This is a node represents a space on the scene
        // -- This is what will be used to attach object geometry to display the models
        let planeNode = SCNNode(geometry: plane)
        
        let x = CGFloat(planeAnchor.center.x)
        let y = CGFloat(planeAnchor.center.y)
        let z = CGFloat(planeAnchor.center.z)
        planeNode.position = SCNVector3(x,y,z)
        planeNode.eulerAngles.x = -.pi / 2
        
        //Add the plane node to the scene node
        node.addChildNode(planeNode)
        
    }
    
    //This method is called every update from the AR renderer to update the horizontal plane - in the event that it detects more suitable geometry, it will expand in size
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

//An extension from the float4x4 type that allows us to easily have an additional column translation to help with the AR world coordinates
extension float4x4 {
    var translation: float3 {
        //Defining a new member - translation - that will be apart of a float4x4, that can store 3 columns for the x,y and z values
        let translation = self.columns.3
        return float3(translation.x, translation.y, translation.z)
    }
}

//Allow us to define a custom colour from UIColour to simulate the dirt like colour pigs are associated with on a farm
extension UIColor {
    open class var transparentLightBrown: UIColor {
        return UIColor(red: 204/255, green: 153/255, blue: 102/255, alpha: 0.50)
    }
}
