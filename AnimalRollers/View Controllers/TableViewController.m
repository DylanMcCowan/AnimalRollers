//
//  TableViewController.m
//  AnimalRollers
//
//  Created by Xcode User on 2018-04-21.
//  Copyright © 2018 GreyCodeGroup. All rights reserved.
//

#import "TableViewController.h"
#import "UserCell.h"
#import "Data.h"


@interface TableViewController()

@end

@implementation TableViewController
@synthesize mainHandler;


-(IBAction)unwindToThisViewController:(UIStoryboardSegue *) sender
{
    
}


#pragma mark Table Methods
- (NSUInteger)tableView: (UITableView *) tableView numberOfRowsInSection:(NSInteger)section
{
    return [mainHandler.users count];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}


-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"Cell";
    UserCell *cell = (UserCell *) [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[UserCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellIdentifier];
    }
    
    NSInteger row = indexPath.row;
    Data *d = [mainHandler.users objectAtIndex:row];
    cell.nameLabel.text = d.name;
    cell.levelLabel.text = d.level;
    cell.scoreLabel.text = d.score;
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}




#pragma mark View Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.mainHandler = (DataHandler *) [[UIApplication sharedApplication] delegate];
    [mainHandler readDatabase];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
