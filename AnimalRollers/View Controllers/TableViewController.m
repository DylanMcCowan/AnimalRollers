//
//  TableViewController.m
//  AnimalRollers
//
//  Created by Mahadevan Ramakrishnan on 2018-04-21.
//  Copyright © 2018 GreyCodeGroup. All rights reserved.
//

#import "TableViewController.h"
#import "UserCell.h"
#import "Player.h"


@interface TableViewController()

@property (nonatomic, weak) IBOutlet UIButton *btnAddPlayer;

@end

@implementation TableViewController
@synthesize mainHandler;



-(IBAction)unwindToTableView:(UIStoryboardSegue *)sender
{
}

#pragma mark Table Methods
- (NSInteger)tableView: (UITableView *) tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.mainHandler.players count];
    //return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"in view cell");
    NSString *cellIdentifier = @"cell";
    UserCell *cell = (UserCell *) [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[UserCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellIdentifier];
    }
    
    NSInteger row = indexPath.row;
    Player *d = [mainHandler.players objectAtIndex:row];
    NSString *sName= @"Name:";
    NSString *sLevel= @"Level:";
    NSString *sScore= @"Score:";
    cell.nameLabel.text = [sName stringByAppendingString:d.name];
    cell.levelLabel.text = [sLevel stringByAppendingString:d.level];
    cell.scoreLabel.text = [sScore stringByAppendingString:d.score];
    
   // cell.nameLabel.text = @"Saloni";
    // cell.levelLabel.text = @"Saloni";
    //cell.scoreLabel.text = @"saloni";
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

#pragma mark View Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"in view did load");
    
  
}

-(void)viewWillAppear:(BOOL)animated
{
    self.mainHandler= [[DataHandler alloc]init];
    bool success = [self.mainHandler initalizeDataHandler];
    [self.mainHandler checkAndInitDatabase];
    [self.mainHandler readDatabase];
    
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
