//
//  HomeViewController.swift
//  AnimalRollers
//
//  Created by GreyCodeGroup on 2018-04-21.
//  Copyright © 2018 GreyCodeGroup. All rights reserved.

//This is the main screen home view contoller which acts as the hub for the application. Providing the navigation /buttons to all the other areas of functionality
//

//We need UIKit, SriteKit and AVFoundation to run the aniamtion and sounds
import UIKit
import SpriteKit
import AVFoundation




class HomeViewController: UIViewController {
    
    //Define outlets for new game, viewing players table, settings page, AR mode and webview - (Author Dylan)
    @IBOutlet var btnNewGame : UIButton!
    @IBOutlet var btnViewPlayers : UIButton!
    @IBOutlet var btnSettings : UIButton!
    @IBOutlet var btnARMode : UIButton!
    @IBOutlet var btnWebsiteInfo : UIButton!
    
    //SpriteKit scene for Animation - (Author Harjot)
    @IBOutlet var scnPigScene : SKView!
    
    //Audio player for background sound - (Author Gustavo)
     var player = AVAudioPlayer()
    
    //Variable to hold the pig scene animation - (Author Harjot)
    var pigScene : PigScene?
    
   

    //Allow unwind functionality and return to this home view controller
    @IBAction func unwindToHome(sender: UIStoryboardSegue)
    {
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view
        
        self.pigScene = PigScene(size: CGSize(width: self.scnPigScene.frame.size.width, height: self.scnPigScene.frame.size.height))
        
        self.scnPigScene.presentScene(pigScene)
        
        pigScene?.walkpig()
        
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
