//
//  ViewController.m
//  UserInfomation
//
//  Created by david on 2016. 11. 7..
//  Copyright © 2016년 david. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

///사용자 패스워드 라벨
@property (weak, nonatomic) IBOutlet UILabel *userIDLabel;   //강사님 idLabel
///사용자 비밀번호 라벨
@property (weak, nonatomic) IBOutlet UILabel *userPWLabel;   //강사님 pwLabel
///사용자 성 라벨
@property (weak, nonatomic) IBOutlet UILabel *userLastNameLabel;   //강사님 nameLabel
///사용자 이름 라벨
@property (weak, nonatomic) IBOutlet UILabel *userFirstNameLabel;   //강사님 hobbyLabel
///사용자 나이 라벨
@property (weak, nonatomic) IBOutlet UILabel *userAgeLabel;   //강사님 ageLabel
///사용자 취미 라벨
@property (weak, nonatomic) IBOutlet UILabel *userHobbyLabel;   //강사님 hobbyLabel

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
    //KVO addObserver
    [[UserInfomation sharedManager] addObserver:self
                                     forKeyPath:@"userID"
                                        options:NSKeyValueObservingOptionNew
                                        context:nil];
    
    [[UserInfomation sharedManager] addObserver:self
                                     forKeyPath:@"userPW"
                                        options:NSKeyValueObservingOptionNew
                                        context:nil];
    
    [[UserInfomation sharedManager] addObserver:self
                                     forKeyPath:@"userLastName"
                                        options:NSKeyValueObservingOptionNew
                                        context:nil];
    
    [[UserInfomation sharedManager] addObserver:self
                                     forKeyPath:@"userFirstName"
                                        options:NSKeyValueObservingOptionNew
                                        context:nil];
    
    //NSNotificationCenter addObserver
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceiveSettingUserInfoLabel:)
                                                 name:DidSettingUserInfo
                                               object:nil];
//    강사님 코드
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(didReceiveHobbyChanged:) name:DidChangeHobbyValueNotification
//                                               object:[UserInformation sharedUserInfo]];
    
}

//KVO 값이 변경될경우 호출
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    UserInfomation *userInfo = [UserInfomation sharedManager];
    self.userIDLabel.text = userInfo.userID;
    self.userPWLabel.text = userInfo.userPW;
    self.userLastNameLabel.text = userInfo.userLastName;
    self.userFirstNameLabel.text = userInfo.userFirstName;
}

//userInfoVC에서 버튼을 눌렀을때 메서드 호출
- (void)didReceiveSettingUserInfoLabel:(NSNotification *)noti
{
    self.userAgeLabel.text = [[noti userInfo] objectForKey:userAge];
    self.userHobbyLabel.text = [[noti userInfo] objectForKey:userHobby];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
