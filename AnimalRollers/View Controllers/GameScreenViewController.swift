//
//  GameScreenViewController.swift
//  AnimalRollers
//
//  Created by Dylan McCowan on 2018-04-21.
//  Copyright © 2018 GreyCodeGroup. All rights reserved.
//

import UIKit

class GameScreenViewController: UIViewController {
    
    @IBOutlet var btnSlider : UIButton!
    @IBOutlet var btnTrotter : UIButton!
    @IBOutlet var btnRazorback : UIButton!
    @IBOutlet var btnSnouter : UIButton!
    @IBOutlet var btnLeaningJowler : UIButton!
    @IBOutlet var btnPigOut : UIButton!
    @IBOutlet var btnEndTurn : UIButton!
    @IBOutlet var btnQuitGame : UIButton!
    
    @IBOutlet var lbCurrentPlayer : UILabel!
    @IBOutlet var lbCurrentScore : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
