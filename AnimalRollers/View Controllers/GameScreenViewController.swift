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
    
    @IBOutlet var swScoreDoubler : UISwitch!
    
    @IBOutlet var lbCurrentPlayer : UILabel!
    @IBOutlet var lbCurrentScore : UILabel!
    
    let gl = GameLogic()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Game Actions
    @IBAction func endPlayerTurn(sender: UIButton)
    {
        endTurn()
    }
    
    @IBAction func playerQuitGame(sender: UIButton)
    {
        let quitAlert = UIAlertController(title: "Are you sure?", message: "Do you wish to quit the game? Any scores and progress will be lost for all players", preferredStyle: .alert)
        
        let yesQuit = UIAlertAction(title: "Yes", style: .default, handler:
            {(alert : UIAlertAction!) in
                self.gl.quitGame()
                self.dismiss(animated: true, completion: nil)
        })
        
        let noQuit = UIAlertAction(title: "No", style: .cancel, handler: nil)
        
        quitAlert.addAction(yesQuit)
        quitAlert.addAction(noQuit)
        present(quitAlert, animated: true)
    }
    
    @IBAction func playerSelectedPig(sender: UIButton)
    {
        var multiplier = 1
        if swScoreDoubler.isOn
        {
            multiplier = 4
            swScoreDoubler.setOn(false, animated: true)
        }
        
        switch sender.tag {
        case 0:
            gl.calculateScore(newScore: 1)
            break
        case 1:
            gl.calculateScore(newScore: (5 * multiplier) )
            break
        case 2:
            gl.calculateScore(newScore: (5 * multiplier) )
            break
        case 3:
            gl.calculateScore(newScore: (10 * multiplier) )
            break
        case 4:
            gl.calculateScore(newScore: (15 * multiplier) )
            break
        case 5:
            gl.calculateScore(newScore: -1)
            alertPigOut()
            endTurn()
            break
        default:
            gl.calculateScore(newScore: -2)
        }
        updatePlayerScoreLabel()
    }
    
    private func endTurn()
    {
        updatePlayer()
    }
    
    private func alertPigOut()
    {
         let pigoutAlert = UIAlertController(title: "Oh No!", message: "You just pigged-out, your turn is over and earn no points this turn", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "Better Luck Next Round!", style: .cancel, handler: nil)
        pigoutAlert.addAction(ok)
        present(pigoutAlert, animated: true)
    }
    
    private func updatePlayerScoreLabel()
    {
        lbCurrentScore.text = gl.getCurrentScore()
    }
    
    private func updatePlayer()
    {
        lbCurrentScore.text = String(gl.getCurrentScore())
        lbCurrentPlayer.text = gl.nextPlayer()
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
