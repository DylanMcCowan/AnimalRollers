//
//  ViewController.swift
//  SoundControlandSocialKit
//
//  Created by Gustavo Silva on 2018-04-21.
//  Copyright © 2018 Grey Code Group. All rights reserved.
//

import UIKit
//step 1 for background music
import AVFoundation

//step 2 for background music, global because it must be accessed everywhere
var player = AVAudioPlayer()


class ViewController: UIViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //step 3 for background music
        do
        {
            let audioPath = Bundle.main.path(forResource: "Bama Country", ofType: "mp3")
            try player = AVAudioPlayer(contentsOf: NSURL (fileURLWithPath: audioPath!) as URL)
        }
        catch
        {
            //error
        }
        player.play()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

