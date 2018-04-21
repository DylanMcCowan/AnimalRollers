//
//  Player.h
//  Final Project
//
//  Created by Mahadevan Ramakrishnan on 2018-04-18.
//  Copyright © 2018 Mahadevan Ramakrishnan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player: NSObject
{
    NSString *name;
    NSString *level;
    NSString *score;

}

@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *level;
@property(nonatomic, strong) NSString *score;


-(id)initWithData:(NSString *)playerName playerLevel:(NSString *)level playerScore:(NSString *)score;



@end
