//
//  DataHandler.h
//  Assignment-2
//
//  Created by Dylan McCowan on 2018-04-18.
//  Copyright © 2018 Dylan McCowan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "UserData.h"

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
-(BOOL)insertIntoDatabase:(UserData *)user;
-(BOOL)initalizeDataHandler;
@end
