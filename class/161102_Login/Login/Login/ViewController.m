//
//  ViewController.m
//  Login
//
//  Created by david on 2016. 10. 24..
//  Copyright © 2016년 david. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

///아이디 TextField
@property (weak, nonatomic) IBOutlet UITextField *IDTextField;
///패스워드 TextField
@property (weak, nonatomic) IBOutlet UITextField *PWTextField;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

//viewController의 lifeCycle에 따라 화면전환
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    //view가 그려지기전에 navigationBar를 숨겨라
    self.navigationController.navigationBar.hidden = YES;
}

///sender에는 뭐가 들어올까
- (IBAction)tabBackground:(id)sender
{
    for (UIView *view in [self.view subviews])
    {
        if ([view isFirstResponder])
        {
            [view endEditing:YES];
        }
    }
}

//로그인버튼 클릭
- (IBAction)clickLoginButton:(UIButton *)sender
{
    //저장된 유저 아이디
    NSString *joinedID = [[DataCenter sharedInstance] getUserID];
    //입력된 유저 아이디
    NSString *loginID = self.IDTextField.text;
    
    //저장 = 입력(아이디)
    if ([joinedID isEqualToString:loginID])
    {
        //저장된 유저 패스워드
        NSString *joinedPW = [[DataCenter sharedInstance] getUserPW];
        //입력된 유저 패스워드
        NSString *loginPW = self.PWTextField.text;
        
        //저장 = 입력(비밀번호)
        if ([joinedPW isEqualToString:loginPW])
        {
            //메인화면으로 이동
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            UIViewController *mainViewController = [storyboard instantiateViewControllerWithIdentifier:@"mainPage"];
            [self.navigationController pushViewController:mainViewController animated:YES];
            
            //로그인 상태 저장
            [[DataCenter sharedInstance] setLoginState:YES];
            
        } else //비밀번호체크(불일치)
        {
            UIAlertController *notEqualAlert = [UIAlertController alertControllerWithTitle:@"로그인 실패"
                                                                                message:@"비밀번호가 틀렸습니다."
                                                                         preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인"
                                                               style:UIAlertActionStyleDefault
                                                             handler:nil];
            [notEqualAlert addAction:okAction];
            [self presentViewController:notEqualAlert animated:YES completion:nil];
        }
        
    //저장 != 입력(아이디)
    } else
    {
        UIAlertController *notEqualAlert = [UIAlertController alertControllerWithTitle:@"로그인 실패"
                                                                               message:@"등록된 아이디가 없습니다."
                                                                        preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인"
                                                           style:UIAlertActionStyleDefault
                                                         handler:nil];
        [notEqualAlert addAction:okAction];
        [self presentViewController:notEqualAlert animated:YES completion:nil];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
