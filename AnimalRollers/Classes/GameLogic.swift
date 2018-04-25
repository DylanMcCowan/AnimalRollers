//
//  GameLogic.swift
//  AnimalRollers
//
//  Created by Dylan McCowan on 2018-04-10.
//  Copyright © 2018 GreyCodeGroup. All rights reserved.
//
//  This file provides all common game logic functionality to the application
//

import UIKit

class GameLogic: NSObject {
    
    //App Delegate instance to work with methods and database
    private let appDel = UIApplication.shared.delegate as! AppDelegate
    
    //Keep track of what index of the gamePlayers array we currently are on for the players
    var currentPlayerIndex = 0;
    
    //Holds the player's inital score value
    var currPlayerInitalScore : String?
    
    //Holds the value of points they have scored durring their current turn
    var currPlayerRunningScore = 0
    
    //The threshold to determine the winner
    private  var  WIN_SCORE = 0
    
    //If there is a winner
    private var PLAYER_WINS : Bool
    
    //Access the random value generator
    private var rndValue : RandomValueGenerator
    
    private var haptic : HapticFeedback

    //Go through an assign all of the players recieved
    init(players: Array<Player>, difficulty: Int) {
        for p in players {
            //Ensured their game scores are all set to zero since it is a new game
            p.gameScore = 0
            appDel.gamePlayers.append(p)
        }
        
        //Assign the win score to the difficulty requested
        WIN_SCORE = difficulty
        PLAYER_WINS = false
        
        //Access the class to generate random values
        rndValue = RandomValueGenerator()
        
        //Access the haptic feedback functionality - Only avaialble for iPhone 7 and above
        haptic = HapticFeedback()
        
        //Set the intal socre
        currPlayerInitalScore = appDel.gamePlayers[currentPlayerIndex].score
    }
    
    //When the turn is over, we need to save their running score to their total score, advance the index and return the name of the next player in line
    func nextPlayer() -> String
    {
        //SAVE THE CURRENT RUNNING SCORE FOR THE CURRENT PLAYER to their Game Score
        appDel.gamePlayers[currentPlayerIndex].gameScore += currPlayerRunningScore
        currPlayerRunningScore = 0
  
        //ADVANCE TO THE NEXT PLAYER IN THE PLAYER OBJECTS
        if currentPlayerIndex == appDel.gamePlayers.count - 1
        {
            currentPlayerIndex = 0
        }else{
            currentPlayerIndex += 1
        }
        //RETURN THE NAME OF THE NEXT PLAYER (WHICH IS NOW THE CURRENT ONE)
        return appDel.gamePlayers[currentPlayerIndex].name
    }
    
    //This method is responsible for calcualting the player's new score
    func calculateScore(newScore:Int)
    {
        //UPDATE THE CURRENT PLAYER'S RUNNING SCORE to zero since they pigged-out
        if newScore == -10
        {
            currPlayerRunningScore = 0
            
        }else if newScore == -2
        {
        }else{
            //Add their running score and the new score together
            currPlayerRunningScore += newScore
        }
        
        //Check to see if there is a winner
        determineWinner()
        
    }
    
    //Allow vibration feedback to be given through haptic feedback
    func provideFeedBack(isAggressive: Bool, sender: UIButton)
    {
        if isAggressive
        {
            haptic.errorButtonTapped(sender)
        }else{
            haptic.lightButtonTapped(sender)
        }
    }
    
    //Returns the current score value as a string for the current player
    func getCurrentScore() -> String
    {
        return String(appDel.gamePlayers[currentPlayerIndex].gameScore + currPlayerRunningScore)
    }
    
    //Save the player's current score at the end of their turn to their game score based on the value of their running score
    func updateCurrentScore()
    {
        appDel.gamePlayers[currentPlayerIndex].gameScore = currPlayerRunningScore
    }
    
    //This quits the game - need to remove all the players from the game players array
    func quitGame()
    {
        //REMOVE ALL PLAYERS FROM CURRENT GAME OBJECT
        appDel.gamePlayers.removeAll()
        appDel.gamePlayers = nil
    }
    
    //Return a random value for the computer mode's rolling and dice mode of the game
    func getRandomValue() -> Int
    {
        return rndValue.Random()
    }
    
    //Return the value of PLAYER_WINS, which is only true if a player has won
    func gameWon() -> Bool
    {
        return PLAYER_WINS
    }
    
    //Determine if the current player's saved score combined with their running score exceeds the winning threshold, if so, set the player wins variable to true
    private func determineWinner()
    {
        if currPlayerRunningScore + appDel.gamePlayers[currentPlayerIndex].gameScore >= WIN_SCORE
        {
            //PLAYER WINS
            PLAYER_WINS = true
        }
    }
    

}
