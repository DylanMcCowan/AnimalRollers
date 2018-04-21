//
//  UserData.h
//  Assignment-2
//
//  Created by Dylan McCowan on 2018-04-18.
//  Copyright © 2018 Dylan McCowan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserData : NSObject
{
    NSString *name;
    NSString *address;
    NSString *phone;
    NSString *email;
    NSString *avatarName;
    NSInteger age;
    NSString *gender;
    NSString *dob;
}

@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *address;
@property(nonatomic, strong) NSString *phone;
@property(nonatomic, strong) NSString *email;
@property(nonatomic, strong) NSString *avatarName;
@property(nonatomic) NSInteger age;
@property(nonatomic, strong) NSString *gender;
@property(nonatomic, strong) NSString *dob;

-(id)initWithData:(NSString *)name usrAddr:(NSString *)addr usrPhone:(NSString *)phone usrEmail:(NSString *)em usrAvatar:(NSString *)avatar usrAge:(NSInteger)age usrGender:(NSString *)gender usrDob:(NSString *)d;



@end
