//
//  WCSCalendarViewController.m
//  WhigClioCalendar
//
//  Created by Frank Jiang on 15/6/14.
//  Copyright (c) 2014 Whig-Cliosophic Society. All rights reserved.
//

#import "WCSCalendarViewController.h"
#import <Firebase/Firebase.h>

@interface WCSCalendarViewController () <UITableViewDataSource>

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) IBOutlet UILabel *titleLabel;

@property (nonatomic, strong) NSMutableArray *events;

@property (nonatomic, strong) Firebase *firebase;

@end

@implementation WCSCalendarViewController

#pragma mark - Initialisation

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Do stuff
    }
    return self;
}

#pragma mark - UIViewController methods

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Adjusting top of table
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // Set up Firebase
    
    self.firebase = [[Firebase alloc] initWithUrl:@"https://luminous-fire-6753.firebaseio.com/Events"];
    [self.firebase observeEventType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot) {
        self.events = [[NSMutableArray alloc] init];
        for (FDataSnapshot *child in snapshot.children) {
            [self.events addObject:child.name];
        }
        [self.tableView reloadData];
    }];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Table methods

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [self.events count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
     cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"UITableViewCell"];
    }
    
    cell.textLabel.text = self.events[indexPath.row];
    
    return cell;
}

@end
