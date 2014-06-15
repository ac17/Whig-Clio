//
//  ACViewController.m
//  Whig-Clio
//
//  Created by Angelica Chen on 3/19/14.
//  Copyright (c) 2014 Angelica Chen. All rights reserved.
//

#import "ACViewController.h"
#import "Firebase/Firebase.h"

@interface ACViewController ()

@property (strong, nonatomic) NSMutableArray *events;

@property (strong, nonatomic) Firebase *fire;

@end

@implementation ACViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.events = [[NSMutableArray alloc] init];
        [self.events addObject:@"Events"];
        self.fire = [[Firebase alloc] initWithUrl:@"https://luminous-fire-6753.firebaseio.com/Events"];
        [self.fire observeSingleEventOfType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot) {
            for (FDataSnapshot* child in snapshot.children) {
                [self.events addObject:child.name];
                NSLog(@"%@", self.events);
            }
            [self.feed reloadData];
        }];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.fire observeEventType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot) {
        for (FDataSnapshot* child in snapshot.children) {
            [self.events addObject:child.name];
            NSLog(@"%@", self.events);
        }
    }];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.feed reloadData];
    
}

- (NSInteger)tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section
{
    return [self.events count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                      initWithStyle:UITableViewCellStyleDefault
                    reuseIdentifier:SimpleTableIdentifier];
    }
    
    cell.textLabel.text = self.events[indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
