//
//  Player.m
//  Final Project
//
//  Created by Mahadevan Ramakrishnan on 2018-04-18.
//  Copyright © 2018 Mahadevan Ramakrishnan. All rights reserved.
//

#import "Player.h"

@implementation Player

@synthesize name, level, score, gameScore;

//name, level, score
-(id)initWithData:(NSString *)playerName playerLevel:(NSString *)level playerScore:(NSString *)score;
{
    self = [super init];
    if(self)
    {
        self.name = playerName;
        self.level = level;
        self.score = score;
        self.gameScore = 0;
        
       
    }
    
    return self;
}

@end
