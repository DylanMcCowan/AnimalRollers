//
//  AppDelegate.swift
//  AnimalRollers
//
//  Created by Dylan McCowan on 2018-03-27.
//  Copyright © 2018 GreyCodeGroup. All rights reserved.
//
//The App delegate serves as a platform for the game to provide singleton data access and Game logic instances to ensure a coordinated and efficient operation of the applicaiton
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    //GAME LOGIC Handler - To access a game logic instance
    var gl : GameLogic?
    
    //DATAHANDLER - For Database reading and writing
    var dh : DataHandler!

    
    //PLAYERS CURRENTLY IN A GAME - This stores players who are currently in a game as created by a new instance of GameLogic
    var gamePlayers : Array<Player>!

    //When the application first loads, ensure everything is properly instanciated with database except GameLogic
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        dh = DataHandler()
        dh.initalizeDataHandler()
        dh.checkAndInitDatabase()
        dh.readDatabase()

        return true
    }
    
    //When a new game has been requested, we need to create a new game logic instance to handle the functionality
    func startNewGame()
    {
        //Instanciate the array of game players
       gamePlayers = Array<Player>()
       var playerCollection = Array<Player>()
        
        gamePlayers.removeAll()
        //Add all of the players in the database into the gameplayers
        for pl in dh.players {
            playerCollection.append(pl as! Player)
        }
        
        //Create the new GameLogic instance with the players that will be playing the game, and setting the win threshold to 100
        gl = GameLogic(players: playerCollection, difficulty: 100)
    }
 

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

