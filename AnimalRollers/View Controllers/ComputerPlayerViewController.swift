//
//  ComputerPlayerViewController.swift
//  AnimalRollers
//
//  Created by Dylan McCowan on 2018-04-24.
//  Copyright © 2018 GreyCodeGroup. All rights reserved.
//

import UIKit

class ComputerPlayerViewController: UIViewController {
    
    @IBOutlet var lbCurrentPlayer : UILabel!
    @IBOutlet var lbCurrentScore : UILabel!
    
    @IBOutlet var btnEndTurn : UIButton!
    @IBOutlet var btnRollPigs : UIButton!
    @IBOutlet var btnQuitGame : UIButton!
    
    @IBOutlet var ivLeftRollResult : UIImageView!
    @IBOutlet var ivRightRollResult : UIImageView!
    
    
    
    var resultImages : Array<UIImage> = []
    
    let scoreValues : Array<Int> = [1,5,5,10,15]
    
    let del = UIApplication.shared.delegate as! AppDelegate
    
    @IBAction func endPlayerTurn(sender: UIButton)
    {
        endTurn()
    }
    
    @IBAction func playerQuitGame(sender: UIButton)
    {
        let quitAlert = UIAlertController(title: "Are you sure?", message: "Do you wish to quit the game? Any scores and progress will be lost for all players", preferredStyle: .alert)
        
        let yesQuit = UIAlertAction(title: "Yes", style: .default, handler:
        {(alert : UIAlertAction!) in
            self.del.gl?.quitGame()
            self.dismiss(animated: true, completion: nil)
        })
        
        let noQuit = UIAlertAction(title: "No", style: .cancel, handler: nil)
        
        quitAlert.addAction(yesQuit)
        quitAlert.addAction(noQuit)
        present(quitAlert, animated: true)
    }
    
    @IBAction func rollPigs(sender: UIButton)
    {
        let rightResultValue = del.gl?.getRandomValue()
        let leftResultValue = del.gl?.getRandomValue()
        updateRollResultImages(leftValue: leftResultValue!, rightValue: rightResultValue!)
        
        if rightResultValue == leftResultValue
        {
            if rightResultValue == 6
            {
                alertPigOut();
                endTurn();
            }else{
                del.gl?.calculateScore(newScore: (4 * scoreValues[rightResultValue!]))
            }
        }else{
            del.gl?.calculateScore(newScore: (scoreValues[leftResultValue!] + scoreValues[rightResultValue!]))
        }
        
    }

    private func updateRollResultImages(leftValue: Int, rightValue: Int)
    {
        ivLeftRollResult.image = resultImages[leftValue]
        ivRightRollResult.image = resultImages[rightValue]
    }
    
    private func endTurn()
    {
        updatePlayer()
        isWinner()
        
    }
    
    private func isWinner()
    {
        if del.gl?.gameWon() == true
        {
            let winAlert = UIAlertController(title: "Winner!", message: "You reached the winning score!", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "Congrats!", style: .cancel, handler: nil)
            winAlert.addAction(ok)
            present(winAlert, animated: true)
        }
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
        lbCurrentScore.text = del.gl?.getCurrentScore()
    }
    
    private func updatePlayer()
    {
        lbCurrentScore.text = String(del.gl!.getCurrentScore())
        lbCurrentPlayer.text = del.gl?.nextPlayer()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        resultImages.insert(UIImage(named: "pig-1.png")!, at: 1)
        resultImages.insert(UIImage(named: "pig-2.png")!, at: 2)
        resultImages.insert(UIImage(named: "pig-3.png")!, at: 3)
        resultImages.insert(UIImage(named: "pig-4.png")!, at: 4)
        resultImages.insert(UIImage(named: "pig-5.png")!, at: 5)
        resultImages.insert(UIImage(named: "pig-6.png")!, at: 6)
        
  
        
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
