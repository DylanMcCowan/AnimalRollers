//
//  TableViewController.h
//  AnimalRollers
//
//  Created by Mahadevan Ramakrishnan on 2018-04-21.
//  Copyright © 2018 GreyCodeGroup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataHandler.h"

@interface TableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    DataHandler *mainHandler;
}

@property (nonatomic, strong) DataHandler *mainHandler;

@end
