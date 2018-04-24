//
//  GameLogic.swift
//  AnimalRollers
//
//  Created by Dylan McCowan on 2018-04-21.
//  Copyright © 2018 GreyCodeGroup. All rights reserved.
//

import UIKit

class GameLogic: NSObject {
    
    let appDel = UIApplication.shared.delegate as! AppDelegate
    var currentPlayerIndex = 0;
    
    var currPlayerInitalScore : String?
    var currPlayerRunningScore = 0
    
    private  var  WIN_SCORE = 0
    private var PLAYER_WINS : Bool
    private var rndValue : RandomValueGenerator


    init(players: Array<Player>, difficulty: Int) {
        for p in players {
            appDel.gamePlayers.append(p)
        }
        
        WIN_SCORE = difficulty
        PLAYER_WINS = false
        rndValue = RandomValueGenerator()
        
        currPlayerInitalScore = appDel.gamePlayers[currentPlayerIndex].score
    }

    func pauseMusic()
    {
    }
    
    func nextPlayer() -> String
    {
        //SAVE THE CURRENT RUNNING SCORE FOR THE CURRENT PLAYER to their Game Score
        appDel.gamePlayers[currentPlayerIndex].gameScore += currPlayerRunningScore
        
        //ADVANCE TO THE NEXT PLAYER IN THE PLAYER OBJECTS
        if currentPlayerIndex == appDel.gamePlayers.count
        {
            currentPlayerIndex = 0
            
        }else{
            currentPlayerIndex += 1
        }
        //RETURN THE NAME OF THE NEXT PLAYER (WHICH IS NOW THE CURRENT ONE)
        return appDel.gamePlayers[currentPlayerIndex].name
    }
    
    func calculateScore(newScore:Int)
    {
        //UPDATE THE CURRENT PLAYER'S RUNNING SCORE
        if newScore == -1
        {
            currPlayerRunningScore = 0
            
        }else if newScore == -2
        {
            
            
        }else{
            currPlayerRunningScore += newScore
        }
        
        determineWinner()
    }
    
    func getCurrentScore() -> String
    {
        return String(appDel.gamePlayers[currentPlayerIndex].gameScore)
    }
    
    func quitGame()
    {
        //REMOVE ALL PLAYERS FROM CURRENT GAME OBJECT
        appDel.gamePlayers.removeAll()
    }
    
    func getRandomValue() -> Int
    {
        return rndValue.Random()
    }
    
    func gameWon() -> Bool
    {
        return PLAYER_WINS
    }
    
    private func determineWinner()
    {
        if currPlayerRunningScore + appDel.gamePlayers[currentPlayerIndex].gameScore >= WIN_SCORE
        {
            //PLAYER WINS
            PLAYER_WINS = true;
        }
    }
    

}
