//
//  GameScreenViewController.swift
//  AnimalRollers
//
//  Created by Dylan McCowan on 2018-04-10.
//  Copyright © 2018 GreyCodeGroup. All rights reserved.

//This is the View controller and functionality associated with the score keeper mode of the application
//It makes calls to the Game Logic instance in AppDelegate to handle controlling the flow of the game. This class is responsible for handling user interaction and making the appropriate calls to GameLogic
//

import UIKit

class ScoreKeeperViewController: UIViewController {
    
    //These button represent the various type of rolls that can be made and are assocated with a point value
    @IBOutlet var btnSlider : UIButton!
    @IBOutlet var btnTrotter : UIButton!
    @IBOutlet var btnRazorback : UIButton!
    @IBOutlet var btnSnouter : UIButton!
    @IBOutlet var btnLeaningJowler : UIButton!
    @IBOutlet var btnPigOut : UIButton!
    
    //Allow the player to end their turn and keep their running score
    @IBOutlet var btnEndTurn : UIButton!
    
    //If they roll pigs with the same configuration, allow them to earn the assocated point multiplier
    @IBOutlet var swScoreDoubler : UISwitch!
    
    //Lables to show who the current player is and their current score in the game
    @IBOutlet var lbCurrentPlayer : UILabel!
    @IBOutlet var lbCurrentScore : UILabel!
    
    
    //Allows the user to quit the game and loose all progress made
    @IBOutlet var btnQuit : UIButton!
    
   //Make a connection to the App delegate to work with the Game Logic
    let del = UIApplication.shared.delegate as! AppDelegate

    //We need to start a new game to initalize all of the players that will be playing, and set the labels accordingly
    override func viewDidLoad() {
        super.viewDidLoad()
        //Let the Delegate know that we want to start a new game
       del.startNewGame()
        lbCurrentPlayer.text = del.gl?.nextPlayer()
        lbCurrentScore.text = del.gl?.getCurrentScore()
        swScoreDoubler.isOn = false
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Game Actions
    //if the player wishes to end their turn, this endTurn method wil be called
    @IBAction func endPlayerTurn(sender: UIButton)
    {
        endTurn()
    }
    
    //If the player wishes to quit the game and loose all progress, this will be called
    @IBAction func playerQuitGame(sender: UIButton)
    {
        //Prompt the user with an alert confirming that they are wanting to quit at the risk of loosing their progress
        let quitAlert = UIAlertController(title: "Are you sure?", message: "Do you wish to quit the game? Any scores and progress will be lost for all players", preferredStyle: .alert)
        
        let yesQuit = UIAlertAction(title: "Yes", style: .default, handler:
            {(alert : UIAlertAction!) in
                //Call the game logic's quit game method to end the game and clean up
                self.del.gl?.quitGame()
                self.dismiss(animated: true, completion: nil)
                self.performSegue(withIdentifier: "quitGame", sender: self)
        })
        
        //Allow them to not quit if they want to continue
        let noQuit = UIAlertAction(title: "No", style: .cancel, handler: nil)
        
        quitAlert.addAction(yesQuit)
        quitAlert.addAction(noQuit)
        present(quitAlert, animated: true)
    }
    
    //This method is central to the functioning of the game, Each pig button has a tag assocaited with it that this method will switch through to determine what button was tapped and therefore what point value to assign
    @IBAction func playerSelectedPig(sender: UIButton)
    {
        //The default point multiplier
        var multiplier = 1
        
        //If the player rolled doubles, they can opt to assign the point multiplier
        if swScoreDoubler.isOn
        {
            multiplier = 4
            //Turn it off again
            swScoreDoubler.setOn(false, animated: true)
        }
        
        
        //Switch through the recieved button tag, and based on that, make the appropriate call to the game logic  method to calcualte the new score based on the point value and mutliplier value
        switch sender.tag {
        case 0:
            del.gl?.calculateScore(newScore: 1)
            break
        case 1:
            del.gl?.calculateScore(newScore: (5 * multiplier) )
            break
        case 2:
            del.gl?.calculateScore(newScore: (5 * multiplier) )
            break
        case 3:
            del.gl?.calculateScore(newScore: (10 * multiplier) )
            break
        case 4:
            del.gl?.calculateScore(newScore: (15 * multiplier) )
            break
        case 5:
            //if they got a pig-out, then their running score will be set to zero and their turn will be over
            del.gl?.calculateScore(newScore: -10)
            
            //Alert that they have a pig-out
            alertPigOut()
            
            //End their turn
            endTurn()
            break
        default:
            del.gl?.calculateScore(newScore: -2)
        }
        
        //Determine if there is a winner
       isWinner()
    
        //Update the score label to the user
        updatePlayerScoreLabel()
    }
    
    //This method calls the game logic to see if a winner has crossed the threshold set by the difficulty
    private func isWinner()
    {
        if del.gl?.gameWon() == true
        {
            //Present a win alert to the user
            let winAlert = UIAlertController(title: "Winner!", message: "You reached the winning score!", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "Congrats!", style: .cancel, handler:
            {(alert : UIAlertAction!) in
                //The game is now over since there is a winner, call the quit game method
                self.del.gl?.quitGame()
                self.dismiss(animated: true, completion: nil)
                //Go back to the home screen
                self.performSegue(withIdentifier: "quitGame", sender: self)
            })
            winAlert.addAction(ok)
            present(winAlert, animated: true)
        }
    }
    
    //At the end of the turn, we need to
    private func endTurn()
    {
        updatePlayer()
    }
    
    //Present an alert in the event that the player has pigged-out
    private func alertPigOut()
    {
         let pigoutAlert = UIAlertController(title: "Oh No!", message: "You just pigged-out, your turn is over and earn no points this turn", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "Better Luck Next Round!", style: .cancel, handler: nil)
        pigoutAlert.addAction(ok)
        present(pigoutAlert, animated: true)
    }
    
    //Update the player's score label label from the method provided by Game Logic
    private func updatePlayerScoreLabel()
    {
        lbCurrentScore.text = del.gl?.getCurrentScore()
    }
    
    //When we need to update the player, that means the turn has ended, and we need to advance to the next player through game logic
    private func updatePlayer()
    {
        //Sets the text to be the next player ( as returned by the method )
        lbCurrentPlayer.text = del.gl?.nextPlayer()
        lbCurrentScore.text = String(del.gl!.getCurrentScore())
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
