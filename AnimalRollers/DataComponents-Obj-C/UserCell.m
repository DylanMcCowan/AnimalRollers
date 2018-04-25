//
//  UserCell.m
//  Final Project
//
//  Created by Mahadevan Ramakrishnan on 2018-04-18.
//  Copyright © 2018 Mahadevan Ramakrishnan. All rights reserved.
//
#import "UserCell.h"

@implementation UserCell

@synthesize nameLabel, levelLabel, scoreLabel;

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        nameLabel = [[UILabel alloc] init];
        nameLabel.textAlignment = NSTextAlignmentLeft;
        nameLabel.font = [UIFont systemFontOfSize:20];
        nameLabel.textColor = [UIColor blackColor];
        nameLabel.backgroundColor = [UIColor clearColor];
        
        levelLabel = [[UILabel alloc] init];
        levelLabel.textAlignment = NSTextAlignmentLeft;
        levelLabel.font = [UIFont systemFontOfSize:16];
        levelLabel.textColor = [UIColor blueColor];
        levelLabel.backgroundColor = [UIColor clearColor];
        
        scoreLabel = [[UILabel alloc] init];
        scoreLabel.textAlignment = NSTextAlignmentLeft;
        scoreLabel.font = [UIFont systemFontOfSize:16];
        scoreLabel.textColor = [UIColor blueColor];
        scoreLabel.backgroundColor = [UIColor clearColor];
        
        
        
        [self.contentView addSubview:nameLabel];
        [self.contentView addSubview:levelLabel];
        [self.contentView addSubview:scoreLabel];

    }
        return self;
    
    
}

-(void) layoutSubviews
{
    nameLabel.frame = CGRectMake(10, 5, 460, 20);
    levelLabel.frame = CGRectMake(10, 35, 460, 20);
    scoreLabel.frame = CGRectMake(10, 55, 460, 20);

}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
