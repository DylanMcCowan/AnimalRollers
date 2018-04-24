//
//  AudioSettingsViewController.swift
//  SoundControlandSocialKit
//
//  Created by Xcode User on 2018-04-21.
//  Copyright © 2018 Xcode User. All rights reserved.
//

import UIKit

//var currentVolume : UILabel
//let appDelegate()

import AVFoundation

class AudioSettingsViewController: UIViewController {

    //1 define labels and connect to storyboard
    //for slider
    @IBOutlet var slMasterVolume : UISlider!
    @IBOutlet var lblMasterVolume : UILabel!
    
    //currentVolume = slMasterVolume.value;
    //for segment
    @IBOutlet var sgBackgroundMusicOption : UISegmentedControl!
    
    
    //step 1 for volume control
    //connect it to slider
    @IBAction func slMasterVolumeControl( _sender: UISlider)
    {
        updateLabel()
        player.volume = _sender.value
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //4 call funtion
       updateLabel()
       // updateSongOption()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //3 make action and connect it to slider
    /*
    @IBAction func sliderValueChanged(_ sender : Any)
    {
        
    }
    */
    
  
    //2 define function for changing label
    func updateLabel()
    {
        let vol = slMasterVolume.value;
        let strVol = String(format: "%f", vol)
        lblMasterVolume.text = strVol
    }
    
    //for segment
   // func updateSongOption()
   // {
//        let option = sgBackgroundMusicOption.selectedSegmentIndex;
        
//        if(option == 0)
//        {
//            print(option)
//            let soundURL = Bundle.main.path(forResource: "Bama Country", ofType: "mp3")
//            _ = URL(fileURLWithPath: soundURL!)
//
//            player.play()
//
//        }
//        else if(option == 1)
//        {
//            print(option)
//            //update song
//            let soundURL = Bundle.main.path(forResource: "pigs_on_farm", ofType: "mp3")
//            _ = URL(fileURLWithPath: soundURL!)
//
//            player.play()
//        }
//        else
//        {
//            print(option)
//            //update song
//            let soundURL = Bundle.main.path(forResource: "13-strings-complete_proud_music_preview", ofType: "mp3")
//            _ = URL(fileURLWithPath: soundURL!)
//
//            player.play()
//        }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
