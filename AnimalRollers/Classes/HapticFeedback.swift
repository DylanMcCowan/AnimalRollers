//
//  HapticFeedback.swift
//  AnimalRollers
//
//  Created by Mahadevan Ramakrishnan User on 2018-04-21.
//  Copyright © 2018 GreyCodeGroup. All rights reserved.
//

import UIKit

class HapticFeedback: NSObject {

    @IBAction func errorButtonTapped(_ sender : UIButton)
    {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.error)
    }
    
    @IBAction func warningButtonTapped(_ sender : UIButton)
    {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.warning)
    }
    
    @IBAction func successButtonTapped(_ sender : UIButton)
    {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    
    //generator.prepare() - to be used in the class where we check for collision, to make the feedback sync with the action. This method prepares the taptic engine to generate those feedbacks
    
    @IBAction func lightButtonTapped(_ sender : UIButton)
    {
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
    }
    
    @IBAction func mediumButtonTapped(_ sender : UIButton)
    {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }
    
    @IBAction func heavyButtonTapped(_ sender : UIButton)
    {
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
    }

}
