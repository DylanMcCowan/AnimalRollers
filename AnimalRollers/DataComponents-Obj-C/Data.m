//
//  UserData.m
//  Assignment-2
//
//  Created by Dylan McCowan on 2018-04-18.
//  Copyright © 2018 Dylan McCowan. All rights reserved.
//

#import "Data.h"

@implementation UserData

@synthesize name, address, phone, avatarName, gender, age, email, dob;

//name, address, phone, email, avatar, age, gender, dob
-(id)initWithData:(NSString *)name usrAddr:(NSString *)addr usrPhone:(NSString *)phone usrEmail:(NSString *)em usrAvatar:(NSString *)avatar usrAge:(NSInteger)age usrGender:(NSString *)gender usrDob:(NSString *)d
{
    self = [super init];
    if(self)
    {
        self.address = addr;
        self.age = age;
        self.avatarName = avatar;
        self.gender = gender;
        self.name = name;
        self.phone = phone;
        self.email = em;
        self.dob = d;
    }
    
    return self;
}

@end
