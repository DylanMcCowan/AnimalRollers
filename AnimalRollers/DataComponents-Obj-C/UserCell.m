//
//  UserCell.m
//  Assignment-2
//
//  Created by Dylan McCowan on 2018-04-18.
//  Copyright © 2018 Dylan McCowan. All rights reserved.
//

#import "UserCell.h"

@implementation UserCell

@synthesize nameLabel, addressLabel, phoneLabel, emailLabel, avatarImgView, ageLabel, genderLabel, dobLabel;

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
        
        addressLabel = [[UILabel alloc] init];
        addressLabel.textAlignment = NSTextAlignmentLeft;
        addressLabel.font = [UIFont systemFontOfSize:16];
        addressLabel.textColor = [UIColor blueColor];
        addressLabel.backgroundColor = [UIColor clearColor];
        
        phoneLabel = [[UILabel alloc] init];
        phoneLabel.textAlignment = NSTextAlignmentLeft;
        phoneLabel.font = [UIFont systemFontOfSize:16];
        phoneLabel.textColor = [UIColor blueColor];
        phoneLabel.backgroundColor = [UIColor clearColor];
        
        emailLabel = [[UILabel alloc] init];
        emailLabel.textAlignment = NSTextAlignmentLeft;
        emailLabel.font = [UIFont systemFontOfSize:12];
        emailLabel.textColor = [UIColor blueColor];
        emailLabel.backgroundColor = [UIColor clearColor];
        
        ageLabel = [[UILabel alloc] init];
        ageLabel.textAlignment = NSTextAlignmentLeft;
        ageLabel.font = [UIFont systemFontOfSize:12];
        ageLabel.textColor = [UIColor orangeColor];
        ageLabel.backgroundColor = [UIColor clearColor];
        
        genderLabel = [[UILabel alloc] init];
        genderLabel.textAlignment = NSTextAlignmentLeft;
        genderLabel.font = [UIFont systemFontOfSize:12];
        genderLabel.textColor = [UIColor blueColor];
        genderLabel.backgroundColor = [UIColor clearColor];
        
        dobLabel = [[UILabel alloc] init];
        dobLabel.textAlignment = NSTextAlignmentLeft;
        dobLabel.font = [UIFont systemFontOfSize:12];
        dobLabel.textColor = [UIColor redColor];
        dobLabel.backgroundColor = [UIColor clearColor];
        
        avatarImgView = [[UIImageView alloc] init];
        
        [self.contentView addSubview:nameLabel];
        [self.contentView addSubview:addressLabel];
        [self.contentView addSubview:phoneLabel];
        [self.contentView addSubview:emailLabel];
        [self.contentView addSubview:ageLabel];
        [self.contentView addSubview:genderLabel];
        [self.contentView addSubview:dobLabel];
        [self.contentView addSubview:avatarImgView];
    }
        return self;
    
    
}

-(void) layoutSubviews
{
    avatarImgView.frame = CGRectMake(5,40, 120, 100);
    nameLabel.frame = CGRectMake(130, 5, 460, 20);
    addressLabel.frame = CGRectMake(130, 35, 460, 20);
    phoneLabel.frame = CGRectMake(130, 55, 460, 20);
    emailLabel.frame = CGRectMake(130, 75, 460, 20);
    ageLabel.frame = CGRectMake(130, 95, 460, 20);
    genderLabel.frame = CGRectMake(130, 115, 460, 20);
    dobLabel.frame = CGRectMake(130, 135, 460, 20);
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure th;e view for the selected state
}

@end
