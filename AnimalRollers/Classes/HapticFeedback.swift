//
//  HapticFeedback.swift
//  AnimalRollers
//
//  Created by Mahadevan Ramakrishnan User on 2018-04-21.
//  Copyright © 2018 GreyCodeGroup. All rights reserved.
//

import UIKit

class HapticFeedback: NSObject {

    func errorButtonTapped(_ sender : Any)
    {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.error)
    }
    
    func warningButtonTapped(_ sender : Any)
    {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.warning)
    }
    
     func successButtonTapped(_ sender : Any)
    {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    
    //generator.prepare() - to be used in the class where we check for collision, to make the feedback sync with the action. This method prepares the taptic engine to generate those feedbacks
    
    func lightButtonTapped(_ sender : Any)
    {
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
    }
    
    func mediumButtonTapped(_ sender : Any)
    {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }
    
    func heavyButtonTapped(_ sender : Any)
    {
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
    }

}
