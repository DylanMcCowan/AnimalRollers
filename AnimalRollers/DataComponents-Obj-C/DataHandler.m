//
//  DataHandler.m
//  Assignment-2
//
//  Created by Dylan McCowan on 2018-04-18.
//  Copyright © 2018 Dylan McCowan. All rights reserved.
//

#import "DataHandler.h"


@implementation DataHandler

@synthesize dbName, dbPath, users;

-(BOOL)initalizeDataHandler
{
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
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
    
    [self.users removeAllObjects];
    
    sqlite3 *database;
    if(sqlite3_open([self.dbPath UTF8String], &database)== SQLITE_OK)
    {
        char *sqlStatement = "select * from users";
        sqlite3_stmt *compiledStatement;
        
        if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK)
        {
            while(sqlite3_step(compiledStatement) == SQLITE_ROW)
            {
                //name, address, phone, email, avatar, age, gender, dob
                char *n = (char *)sqlite3_column_text(compiledStatement, 1);
                NSString *name = [NSString stringWithUTF8String:n];
                
                char *ad = (char *)sqlite3_column_text(compiledStatement, 2);
                NSString *address = [NSString stringWithUTF8String:ad];
                
                char *ph = (char *)sqlite3_column_text(compiledStatement, 3);
                NSString *phone = [NSString stringWithUTF8String:ph];
                
                char *em = (char *)sqlite3_column_text(compiledStatement, 4);
                NSString *email = [NSString stringWithUTF8String:em];
                
                char *av = (char *)sqlite3_column_text(compiledStatement, 5);
                NSString *avatar = [NSString stringWithUTF8String:av];
                
                NSInteger age = sqlite3_column_int(compiledStatement, 6);
                
                char *gen = (char *)sqlite3_column_text(compiledStatement, 7);
                NSString *gender = [NSString stringWithUTF8String:gen];
                
                char *d = (char *)sqlite3_column_text(compiledStatement, 8);
                NSString *dob = [NSString stringWithUTF8String:d];
                
                
                UserData *usrData = [[UserData alloc] initWithData:name usrAddr:address usrPhone:phone usrEmail:email usrAvatar:avatar usrAge:age usrGender:gender usrDob:dob];
                
                [self.users addObject:usrData];
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

-(BOOL)insertIntoDatabase:(UserData *)user
{
    sqlite3 *database;
    BOOL returnCode = YES;
    
    if(sqlite3_open([self.dbPath UTF8String], &database) == SQLITE_OK)
    {
        char *sqlStatement = "insert into users values(NULL, ?, ?, ?, ?, ?, ?, ?, ?)";
        sqlite3_stmt * compiledStatement;
        
        if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL)==SQLITE_OK)
        {
            //name, address, phone, email, avatar, age, gender, dob
            sqlite3_bind_text(compiledStatement, 1, [user.name UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(compiledStatement, 2, [user.address UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(compiledStatement, 3, [user.phone UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(compiledStatement, 4, [user.email UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(compiledStatement, 5, [user.avatarName UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_int(compiledStatement, 6, user.age);
            sqlite3_bind_text(compiledStatement, 7, [user.gender UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(compiledStatement, 8, [user.dob UTF8String], -1, SQLITE_TRANSIENT);
            
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
