//
//  AddViewController.swift
//  AnimalRollers
//
//  Created by Xcode User on 2018-04-24.
//  Copyright © 2018 GreyCodeGroup. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet var saveNewPlayerBtn : UIButton!
    @IBOutlet var name: UITextField!
    @IBOutlet var levelText: UITextField!
    @IBOutlet var scoreText: UITextField!
    var player : Player?
    var dh : DataHandler?
    @IBAction func saveToDatabase()
    {
        player = Player.init(data: name.text, playerLevel: levelText.text, playerScore: scoreText.text)
        var successCode : Bool = (dh?.insert(intoDatabase: player))!
        print(successCode);
        
    }
    
    override func viewDidLoad(){
            super.viewDidLoad()
        dh = .init()
        dh?.initalizeDataHandler()
        dh?.checkAndInitDatabase()
      
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
