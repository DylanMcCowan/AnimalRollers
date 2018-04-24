//
//  DataHandler.m
//  Final Project
//
//  Created by Mahadevan Ramakrishnan on 2018-04-18.
//  Copyright © 2018 Mahadevan Ramakrishnan. All rights reserved.
//

#import "DataHandler.h"


@implementation DataHandler

@synthesize dbName, dbPath, players;

-(BOOL)initalizeDataHandler
{
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    self.dbName = @"GameDatabase.db";
    self.players = [[NSMutableArray alloc] init];
  
    NSString *documentsDir = [documentPaths objectAtIndex:0];
    
    self.dbPath = [documentsDir stringByAppendingPathComponent:self.dbName];
    
    return YES;

}

-(void)checkAndInitDatabase
{
    BOOL success;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSLog(@"%@", self.dbPath);
    
    success = [fileManager fileExistsAtPath:self.dbPath];
    
    if(success)
    {return;}
    
    NSString *databasePathFromApp =  [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:self.dbName];
    
    [fileManager copyItemAtPath:databasePathFromApp toPath:self.dbPath error:nil];
}

-(void)readDatabase
{
    
    [self.players removeAllObjects];
    
    sqlite3 *database;
    if(sqlite3_open([self.dbPath UTF8String], &database)== SQLITE_OK)
    {
        char *sqlStatement = "select * from users";
        sqlite3_stmt *compiledStatement;
        
        if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK)
        {
            while(sqlite3_step(compiledStatement) == SQLITE_ROW)
            {
                char *nam = (char *)sqlite3_column_text(compiledStatement, 1);
                NSString *name = [NSString stringWithUTF8String:nam];
                
                char *lev = (char *)sqlite3_column_text(compiledStatement, 2);
                NSString *level = [NSString stringWithUTF8String:lev];
                
                char *sco = (char *)sqlite3_column_text(compiledStatement, 3);
                NSString *score = [NSString stringWithUTF8String:sco];
                
                Player *playerData = [[Player alloc] initWithData:name playerLevel:level playerScore:score];
                
                [self.players addObject:playerData];
            }
            NSLog(@"DONE");
        }else{
            NSLog(@"NOT DONE, NOT OK");
            NSLog(@"Error %s", sqlite3_errmsg(database));
        }
        
        sqlite3_finalize(compiledStatement);
    }else{
        NSLog(@"SQLITE NOT OK");
    }
    
    sqlite3_close(database);
    
}

-(BOOL)insertIntoDatabase:(Player *)p
{
    sqlite3 *database;
    BOOL returnCode = YES;
    
    if(sqlite3_open([self.dbPath UTF8String], &database) == SQLITE_OK)
    {
        char *sqlStatement = "insert into users values(NULL, ?, ?, ?,)";
        sqlite3_stmt * compiledStatement;
        
        if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL)==SQLITE_OK)
        {
            //name, level, high-score
            sqlite3_bind_text(compiledStatement, 1, [p.name UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(compiledStatement, 2, [p.level UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(compiledStatement, 3, [p.score UTF8String], -1, SQLITE_TRANSIENT);
            
        }
        
        if(sqlite3_step(compiledStatement) != SQLITE_DONE)
        {
            NSLog(@"Error %s", sqlite3_errmsg(database));
            returnCode= NO;
        }else{
            NSLog(@"Insert into row id = %lld", sqlite3_last_insert_rowid(database));
        }
        
        sqlite3_finalize(compiledStatement);
    }
    
    sqlite3_close(database);
    
    return returnCode;
    
}


@end
