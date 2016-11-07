//
//  UserInfomationSettingViewController.m
//  UserInfomation
//
//  Created by david on 2016. 11. 7..
//  Copyright © 2016년 david. All rights reserved.
//

#import "UserInfomationSettingViewController.h"

@interface UserInfomationSettingViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userIDTextField;
@property (weak, nonatomic) IBOutlet UITextField *userPWTextField;
@property (weak, nonatomic) IBOutlet UITextField *userLastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *userFirstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *userAgeTextField;
@property (weak, nonatomic) IBOutlet UITextField *userHobbyTextField;


@end

@implementation UserInfomationSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)clickSaveButton:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:DidSettingUserInfo
                                                        object:self
                                                      userInfo:@{userID : _userIDTextField.text,
                                                                 userPW : _userPWTextField.text,
                                                                 userLastName : _userLastNameTextField.text,
                                                                 userFirstName : _userFirstNameTextField.text,
                                                                 userAge : _userAgeTextField.text,
                                                                 userHobby : _userHobbyTextField.text}];
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
