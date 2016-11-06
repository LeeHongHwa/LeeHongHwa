//
//  SignupViewController.m
//  Login
//
//  Created by david on 2016. 10. 24..
//  Copyright © 2016년 david. All rights reserved.
//

#import "SignupViewController.h"

@interface SignupViewController ()

///아이디 텍스트필드
@property (weak, nonatomic) IBOutlet UITextField *IDTextField;

///패스워드 텍스트필드
@property (weak, nonatomic) IBOutlet UITextField *PWTextField;

///RE 패스워드 텍스트필드
@property (weak, nonatomic) IBOutlet UITextField *rePWTextField;

@end

@implementation SignupViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

//회원가입버튼 액션
- (IBAction)clickDismissButton:(UIButton *)sender
{
    //아이디 저장
    NSString *ID = self.IDTextField.text;
    //패스워드 저장
    NSString *PW = self.PWTextField.text;
    //RE 패스워드 저장
    NSString *rePW = self.rePWTextField.text;
    
    //패스워드 = RE 패스워드 && 입력된값이 있을경우
    if ([PW isEqualToString:rePW] && ![ID isEqualToString:@""] && ![PW isEqualToString:@""])
    {
        //데이터 센터에 아이디와 패스워드 저장
        [[DataCenter sharedInstance] setUserID:ID userPW:PW];
        
        //가입 alert
        UIAlertController *EqualAlert = [UIAlertController alertControllerWithTitle:@"회원가입 완료"
                                                                               message:@"회원가입이 완료됬습니다."
                                                                        preferredStyle:UIAlertControllerStyleAlert];
        //확인 버튼 viewController 이동
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인"
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                             
                                                             UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                                                             
                                                             UIViewController *mainViewController = [storyboard instantiateViewControllerWithIdentifier:@"mainPage"];
                                                             [self.navigationController pushViewController:mainViewController animated:YES];
                                                         }];
        [EqualAlert addAction:okAction];
        
        [self presentViewController:EqualAlert animated:YES completion:^{
            //로그인상태 저장
            [[DataCenter sharedInstance] setLoginState:YES];
        }];
        
    //입력된 값이 없을경우
    } else if([ID isEqualToString:@""] || [PW isEqualToString:@""])
    {
        UIAlertController *IdOrPwEmpty = [UIAlertController alertControllerWithTitle:@"아이디 또는 패스워드 빈칸"
                                                                            message:@"아이디 또는 패스워드를 입력해주세요"
                                                                     preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인"
                                                           style:UIAlertActionStyleDefault
                                                         handler:nil];
        [IdOrPwEmpty addAction:okAction];
        [self presentViewController:IdOrPwEmpty animated:YES completion:nil];
    }
    else
    {   //패스워드 불일치
        UIAlertController *notEqualAlert = [UIAlertController alertControllerWithTitle:@"패스워드 불일치"
                                                                               message:@"패스워드가 불일치 했습니다."
                                                                        preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인"
                                                           style:UIAlertActionStyleDefault
                                                         handler:nil];
        [notEqualAlert addAction:okAction];
        [self presentViewController:notEqualAlert animated:YES completion:nil];
    }
}

//키보드 터치
- (IBAction)tabBackground:(UITapGestureRecognizer *)sender
{
    for (UIView *view in [self.view subviews])
    {
        if ([view isFirstResponder])
        {
            [view endEditing:YES];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
