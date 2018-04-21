//
//  UserData.m
//  Final Project
//
//  Created by Mahadevan Ramakrishnan on 2018-04-18.
//  Copyright © 2018 Mahadevan Ramakrishnan. All rights reserved.
//

#import "Data.h"

@implementation Data

@synthesize name, level, score;

//name, level, score
-(id)initWithData:(NSString *)name usrLevel:(NSString *)level usrScore:(NSString *)score;
{
    self = [super init];
    if(self)
    {
        self.name = name;
        self.level = level;
        self.score = score;
        
       
    }
    
    return self;
}

@end
