//
//  WCSHomeViewController.m
//  WhigClioCalendar
//
//  Created by Frank Jiang on 15/6/14.
//  Copyright (c) 2014 Whig-Cliosophic Society. All rights reserved.
//

#import "WCSHomeViewController.h"
#import "WCSCalendarViewController.h"
#import "GradientButton.h"

@interface WCSHomeViewController ()

@property (nonatomic, weak) IBOutlet GradientButton *calendarButton;
@property (nonatomic, weak) IBOutlet GradientButton *eventsButton;
@property (nonatomic, weak) IBOutlet GradientButton *galleryButton;
@property (nonatomic, weak) IBOutlet GradientButton *voteButton;
@property (nonatomic, weak) IBOutlet GradientButton *contactButton;
@property (nonatomic, weak) IBOutlet UIButton *facebookButton;
@property (nonatomic, weak) IBOutlet UIButton *twitterButton;

@property (nonatomic, strong) WCSCalendarViewController *calendarViewController;

@property (nonatomic, strong) IBOutlet UIImageView *logoImageView;

@end

@implementation WCSHomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    
    }

    return self;
}

#pragma mark - UIViewController methods

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.calendarButton useCustomWhiteStyle];
    [self.eventsButton useCustomWhiteStyle];
    [self.galleryButton useCustomWhiteStyle];
    [self.voteButton useCustomWhiteStyle];
    [self.contactButton useCustomWhiteStyle];

}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    // Figure out how to get the carrier stuff and everything withe navigation bar hidden
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [self setNeedsStatusBarAppearanceUpdate];

    self.facebookButton.layer.cornerRadius = 5.0f;
    self.facebookButton.layer.masksToBounds = YES;
    self.twitterButton.layer.cornerRadius = 5.0f;
    self.twitterButton.layer.masksToBounds = YES;
    
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

- (IBAction)openCalendar:(id)sender
{
    if (!self.calendarViewController) {
        self.calendarViewController = [[WCSCalendarViewController alloc] init];
    }
    
    [self.navigationController pushViewController:self.calendarViewController
                                         animated:YES];
}

@end
