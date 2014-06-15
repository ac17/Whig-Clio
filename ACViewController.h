//
//  ACViewController.h
//  Whig-Clio
//
//  Created by Angelica Chen on 3/19/14.
//  Copyright (c) 2014 Angelica Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Firebase/Firebase.h>

@interface ACViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *feed;

@end
