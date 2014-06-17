//
//  WCSHomeViewController.m
//  WhigClioCalendar
//
//  Created by Frank Jiang on 15/6/14.
//  Copyright (c) 2014 Whig-Cliosophic Society. All rights reserved.
//

#import "WCSHomeViewController.h"
#import "WCSCalendarViewController.h"

@interface WCSHomeViewController ()

@property (nonatomic, strong) UIButton *calendarButton;
@property (nonatomic, strong) WCSCalendarViewController *calendarViewController;

@end

@implementation WCSHomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.calendarButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.calendarButton addTarget:self
                                action:@selector(openCalendar:)
                      forControlEvents:UIControlEventTouchUpInside];
        [self.calendarButton setTitle:@"Calendar" forState:UIControlStateNormal];
        self.calendarButton.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
        [self.view addSubview:self.calendarButton];
    }
    return self;
}

#pragma mark - UIViewController methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
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

#pragma mark - Button method

- (void)openCalendar:(id)sender
{
    if (!self.calendarViewController) {
        self.calendarViewController = [[WCSCalendarViewController alloc] init];
    }
    
    [self.navigationController pushViewController:self.calendarViewController
                                         animated:YES];
}

@end
