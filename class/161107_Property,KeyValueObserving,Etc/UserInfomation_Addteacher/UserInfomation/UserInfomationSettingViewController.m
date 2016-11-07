//
//  UserInfomationSettingViewController.m
//  UserInfomation
//
//  Created by david on 2016. 11. 7..
//  Copyright © 2016년 david. All rights reserved.
//

#import "UserInfomationSettingViewController.h"

//editViewController
@interface UserInfomationSettingViewController ()

//@property IBOutlet UILabel *idLabel;
//@property IBOutlet UILabel *pwLabel;

///아이디 텍스트 필드
@property (weak, nonatomic) IBOutlet UITextField *userIDTextField;  //idField
///비밀번호 텍스트 필드
@property (weak, nonatomic) IBOutlet UITextField *userPWTextField;  //pwField
///성 텍스트 필드
@property (weak, nonatomic) IBOutlet UITextField *userLastNameTextField;  //lastNameField
///이름 텍스트 필드
@property (weak, nonatomic) IBOutlet UITextField *userFirstNameTextField;  //firstNameField
///나이 텍스트 필드
@property (weak, nonatomic) IBOutlet UITextField *userAgeTextField;  //ageField
///취미 텍스트 필드
@property (weak, nonatomic) IBOutlet UITextField *userHobbyTextField;  //hobbyField


@end

@implementation UserInfomationSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/**
 userInfomation property setting AND
 popVC AND
 notificationCenter post
 */
- (IBAction)clickSaveButton:(UIButton *)sender
{
    
    UserInfomation *userInfo = [UserInfomation sharedManager];  //info
    userInfo.userID = _userIDTextField.text;
    userInfo.userPW = _userPWTextField.text;
    userInfo.userLastName = _userLastNameTextField.text;
    userInfo.userFirstName = _userFirstNameTextField.text;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:DidSettingUserInfo
                                                        object:self
                                                      userInfo:@{userAge : _userAgeTextField.text,
                                                                 userHobby : _userHobbyTextField.text}];
    
    [self.navigationController popViewControllerAnimated:YES];
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
