//
//  RandomValueGenerator.swift
//  SpriteKitTest
//
//  Created by Xcode User on 2018-04-24.
//  Copyright © 2018 GreyCodeGroup. All rights reserved.
//

import UIKit

class RandomValueGenerator: NSObject {
    var RandomImageIndex1 : Int!
    
  //  var RandomImageIndex2 : Int!
    
    

    
    func Random() -> Int{

        RandomImageIndex1 = Int(arc4random_uniform(6))
        
       // RandomImageIndex2 = Int(arc4random_uniform(6))
        
       // let RandomArray = [PigArray[RandomImageIndex1], PigArray[RandomImageIndex2]]
        
        return RandomImageIndex1
        
       
    }
    
    
    
  
}
