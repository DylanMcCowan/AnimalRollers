//
//  UserCell.h
//  Final Project
//
//  Created by Mahadevan Ramakrishnan on 2018-04-18.
//  Copyright © 2018 Mahadevan Ramakrishnan. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface UserCell : UITableViewCell
{
    //name, level, score
    
    UILabel *nameLabel;
    UILabel *levelLabel;
    UILabel *scoreLabel;
}

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *levelLabel;
@property (nonatomic, strong) UILabel *scoreLabel;

@end
