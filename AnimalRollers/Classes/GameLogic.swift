//
//  GameLogic.swift
//  AnimalRollers
//
//  Created by Dylan McCowan on 2018-04-21.
//  Copyright © 2018 GreyCodeGroup. All rights reserved.
//

import UIKit

class GameLogic: NSObject {
    
    override init() {
    }
    
    func startNewGame()
    {
        //RECIEVE AN ARRAY OF PLAYERS
        
        //ADD THEM TO THE CURRENT PLAYERS OBJECT
    }
    
    func pauseMusic()
    {
    }
    
    func nextPlayer() -> String
    {
        //SAVE THE CURRENT RUNNING SCORE FOR THE CURRENT PLAYER
        //ADVANCE TO THE NEXT PLAYER IN THE PLAYER OBJECTS
        
        return "PLAYER X" //RETURN THE NAME OF THE NEXT PLAYER (WHICH IS NOW THE CURRENT ONE)
    }
    
    func pigOut()
    {
        //REMOVE THE ACCUMULATED SCORE OF THE CURRENT PLAYER TO WHEN THEY STARTED THEIR TURN
    }
    
    func calculateScore(newScore:Int)
    {
        //UPDATE THE CURRENT PLAYER'S RUNNING SCORE
        if newScore == -1
        {
            
        }else if newScore == -2
        {
            pigOut()
            
        }else{
            
        }
    }
    
    func getCurrentScore() -> String
    {
        return "XYZ SCORE" //CURRENT PLAYER SCORE AS A String from the CURRENT PLAYER's RUNNING SCORE
    }
    
    func quitGame()
    {
        //REMOVE ALL PLAYERS FROM CURRENT GAME OBJECT
    }
    
    func getRandomValue() -> Int
    {
        //MAKE A CALL TO THE RANDOM CLASS TO GET A RANDOM VALUE
        return 1;
    }
    
   private func getPlayersFromDatabase()
    {
        //LOAD PLAYERS FROM THE DATABASE
        
    }

}
