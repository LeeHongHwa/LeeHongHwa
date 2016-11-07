//
//  ViewController.m
//  UserInfomation
//
//  Created by david on 2016. 11. 7..
//  Copyright © 2016년 david. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *userIDLabel;
@property (weak, nonatomic) IBOutlet UILabel *userPWLabel;
@property (weak, nonatomic) IBOutlet UILabel *userLastNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *userFirstNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *userAgeLabel;
@property (weak, nonatomic) IBOutlet UILabel *userHobbyLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceiveSettingUserInfoLabel:) name:DidSettingUserInfo
                                               object:nil];
}

- (void)didReceiveSettingUserInfoLabel:(NSNotification *)noti
{
    self.userIDLabel.text = [[noti userInfo] objectForKey:userID];
    self.userPWLabel.text = [[noti userInfo] objectForKey:userPW];
    self.userLastNameLabel.text = [[noti userInfo] objectForKey:userLastName];
    self.userFirstNameLabel.text = [[noti userInfo] objectForKey:userFirstName];
    self.userAgeLabel.text = [[noti userInfo] objectForKey:userAge];
    self.userHobbyLabel.text = [[noti userInfo] objectForKey:userHobby];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
