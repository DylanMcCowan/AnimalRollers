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
        self.backgroundColor = UIColor(red: 12/255.0, green: 162/255.0, blue: 8/255.0, alpha: 1.0)
        var frames:[SKTexture] = []

        let pigatlas = SKTextureAtlas(named: "pig")
        
        for index in 1 ... 10 {
            let textureName = "pig\(index)"
            let texture = pigatlas.textureNamed(textureName)
            frames.append(texture)
        }
        
        self.pigFrames = frames
        
    }
    
    func walkpig(){
        //fatalerror
        let texture = self.pigFrames![0]
        let pig = SKSpriteNode(texture: texture)
        
        pig.size = CGSize(width: 250, height: 250)
        
        let randomPigYPositionGenerator = GKRandomDistribution(lowestValue:50, highestValue: Int(self.frame.size.height))
        
        let yposition = CGFloat(randomPigYPositionGenerator.nextInt())
        
        let righttoleft = arc4random() % 2 == 0
        let xposition = righttoleft ?  self.frame.size.width + pig.size.width / 2 : -pig.size.width / 2
        
        pig.position = CGPoint(x : xposition, y : yposition)
        
        if righttoleft {
            pig.xScale = -1
            
        }
        
        self.addChild(pig)
        
        pig.run(SKAction.repeatForever(SKAction.animate(with: self.pigFrames!, timePerFrame: 0.05, resize: false, restore: true) ))
        
        var rangetocover = self.frame.size.width + pig.size.width
        
        if righttoleft{
            rangetocover *= -1
        }
        
        let time = TimeInterval(abs(rangetocover / 200))
        
        let moveAction = SKAction.moveBy(x: rangetocover, y: 0, duration: time)
        
        let removeAction = SKAction.run{
            pig.removeAllActions()
            pig.removeFromParent()
            
        }
        
        let AllActions = SKAction.sequence([moveAction, removeAction])
        
        pig.run(AllActions)
    }
    
}
