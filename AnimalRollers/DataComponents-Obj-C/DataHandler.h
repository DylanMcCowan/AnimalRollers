//
//  DataHandler.h
//  Final Project
//
//  Created by Mahadevan Ramakrishnan on 2018-04-18.
//  Copyright © 2018 Mahadevan Ramakrishnan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Data.h"

@interface DataHandler : NSObject
{
    NSString *dbPath;
    NSString *dbName;
    NSMutableArray *users;
    
}

@property (nonatomic, strong) NSString *dbPath;
@property (nonatomic, strong) NSString *dbName;
@property (nonatomic, strong) NSMutableArray *users;

-(void)checkAndInitDatabase;
-(void)readDatabase;
-(BOOL)insertIntoDatabase:(Data *)user;
-(BOOL)initalizeDataHandler;
@end
