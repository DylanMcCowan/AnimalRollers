//
//  DataHandler.h
//  Final Project
//
//  Created by Mahadevan Ramakrishnan on 2018-04-18.
//  Copyright © 2018 Mahadevan Ramakrishnan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Player.h"

@interface DataHandler : NSObject
{
    NSString *dbPath;
    NSString *dbName;
    NSMutableArray *players;
    
}

@property (nonatomic, strong) NSString *dbPath;
@property (nonatomic, strong) NSString *dbName;
@property (nonatomic, strong) NSMutableArray *players;

-(void)checkAndInitDatabase;
-(void)readDatabase;
-(BOOL)insertIntoDatabase:(Player *)p;
-(BOOL)initalizeDataHandler;
@end
