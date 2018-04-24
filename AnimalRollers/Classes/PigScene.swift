//
//  PigWalk.swift
//  SpriteKitTest
//
// This class implements SpriteKit and Gameplay kit to make a moving 2D animation

//  Created by Xcode User on 2018-04-21.
//  Copyright © 2018 Harjot. All rights reserved.
//



import UIKit
import SpriteKit
import GameplayKit


class PigScene: SKScene {

    var pigFrames:[SKTexture]?
    
    required init?(coder aDecoder: NSCoder) {
        super .init(coder: aDecoder)
    }
    
    override init(size: CGSize){
        
        super.init(size: size)
        //Changing Background color for the animation
        self.backgroundColor = UIColor(red: 255/255.0, green: 212/255.0, blue: 121/255.0, alpha: 1.0)
        var frames:[SKTexture] = []

        //Assigning images to the atlas
        let pigatlas = SKTextureAtlas(named: "pig")
        
        //for loop to get through all the pig images in the folder
        for index in 1 ... 10 {
            let textureName = "pig\(index)"
            let texture = pigatlas.textureNamed(textureName)
            frames.append(texture)
        }
        
        
        self.pigFrames = frames
        
    }
    
    
    //function to be called in the view controller to start the animation
    func walkpig(){
        
        let texture = self.pigFrames![0]
        let pig = SKSpriteNode(texture: texture)
        
        //size and position of the animation object
        pig.size = CGSize(width: 200, height: 200)
        pig.position = CGPoint(x : 170, y : 100)
        
        self.addChild(pig)
        
        //Repeat the Action forever and set up speed of animation
        pig.run(SKAction.repeatForever(SKAction.animate(with: self.pigFrames!, timePerFrame: 0.08, resize: false, restore: true) ))
        
        let time = TimeInterval(abs(10000))
        
        let moveAction = SKAction.moveBy(x: 0, y: 0, duration: time)
        
        let removeAction = SKAction.run{
            pig.removeAllActions()
            pig.removeFromParent()
            
        }
        //Running the sequence
        let AllActions = SKAction.sequence([moveAction, removeAction])
        
        pig.run(AllActions)
    }
    
}
