//
//  UserCell.h
//  Assignment-2
//
//  Created by Dylan McCowan on 2018-04-18.
//  Copyright © 2018 Dylan McCowan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserCell : UITableViewCell
{
    //name, address, phone, email, avatar, age, gender, dob
    
    UILabel *nameLabel;
    UILabel *addressLabel;
    UILabel *phoneLabel;
    UILabel *emailLabel;
    UILabel *ageLabel;
    UILabel *genderLabel;
    UILabel *dobLabel;
    UIImageView *avatarImgView;
}

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *addressLabel;
@property (nonatomic, strong) UILabel *phoneLabel;
@property (nonatomic, strong) UILabel *emailLabel;
@property (nonatomic, strong) UILabel *ageLabel;
@property (nonatomic, strong) UILabel *genderLabel;
@property (nonatomic, strong) UILabel *dobLabel;

@property (nonatomic, strong) UIImageView *avatarImgView;

@end
