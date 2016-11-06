//
//  LogoutViewController.m
//  Login
//
//  Created by david on 2016. 11. 2..
//  Copyright © 2016년 david. All rights reserved.
//

#import "LogoutViewController.h"

@interface LogoutViewController ()

///로그아웃 상태
@property (weak, nonatomic) IBOutlet UISegmentedControl *logoutStateSegment;

@end

@implementation LogoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //로그아웃 상태 출력
    [self.logoutStateSegment setSelectedSegmentIndex:[[DataCenter sharedInstance] getLogoutState]];
}

//로그아웃 버튼
- (IBAction)touchLogoutButton:(UIButton *)sender
{
    //로그인 기록지우기
    [[DataCenter sharedInstance] removeLoginRecord];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController *loginNavi = [storyboard instantiateViewControllerWithIdentifier:@"rootNavi"];
    [self presentViewController:loginNavi animated:YES completion:nil];
}

//뒤로가기
- (IBAction)touchPopButton:(UIBarButtonItem *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

//로그아웃 상태 변경
- (IBAction)changeNotiValue:(UISegmentedControl *)sender
{
    //선택된 로그아웃 상태 저장
    NSNumber *selectedIndex = [NSNumber numberWithInteger:[self.logoutStateSegment selectedSegmentIndex]];
    //post
    [[NSNotificationCenter defaultCenter] postNotificationName:DidreceiveChangeLogoutState
                                                        object:self
                                                      userInfo:@{userLogoutState:selectedIndex}];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
