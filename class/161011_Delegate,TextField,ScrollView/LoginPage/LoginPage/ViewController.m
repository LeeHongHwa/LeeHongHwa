//
//  ViewController.m
//  LoginPage
//
//  Created by david on 2016. 10. 12..
//  Copyright © 2016년 david. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate, UITextFieldDelegate>

///스크롤뷰
@property UIScrollView *scrollView;
///ID 텍스트 필드
@property UITextField *idTF;
///PW 텍스트 필드
@property UITextField *pwTF;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //로그인 스크롤뷰
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height * (2.f/3.f));
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width, self.view.frame.size.height);
    self.scrollView.bounces = NO;
    self.scrollView.delegate = self;
    [self.view addSubview:self.scrollView];
    
    //아이디,패스워드 배경
    UIView *idAndPwView = [[UIView alloc] init];
    idAndPwView.frame = CGRectMake(32, self.view.frame.size.height/3, self.view.frame.size.width - 64, self.scrollView.frame.size.height);
    idAndPwView.backgroundColor = [UIColor clearColor];
    [self.scrollView addSubview:idAndPwView];
    
    //아이디 라벨
    UILabel *idLb = [[UILabel alloc] init];
    idLb.frame = CGRectMake(0, 16, 30, 35);
    idLb.text = @"ID:";
    idLb.font = [UIFont systemFontOfSize:16];
    idLb.textAlignment = NSTextAlignmentRight;
    idLb.textColor = [UIColor colorWithDisplayP3Red:0/255.f green:0/255.f blue:0/255.f alpha:0.54];
    [idAndPwView addSubview:idLb];
    
    //비밀번호 라벨
    UILabel *pwLb = [[UILabel alloc] init];
    pwLb.frame = CGRectMake(0, 16 + 40, 30, 35);
    pwLb.text = @"PW:";
    pwLb.font = [UIFont systemFontOfSize:16];
    pwLb.textAlignment = NSTextAlignmentRight;
    pwLb.textColor = [UIColor colorWithDisplayP3Red:0/255.f green:0/255.f blue:0/255.f alpha:0.54];
    [idAndPwView addSubview:pwLb];
    
    //아이디 텍스트 필드
    self.idTF = [[UITextField alloc] init];
    self.idTF.frame = CGRectMake(idLb.frame.size.width + 4, idLb.frame.origin.y, idAndPwView.frame.size.width - idLb.frame.size.width - 8, idLb.frame.size.height);
    self.idTF.placeholder = @"아이디를 입력해 주세요";
    self.idTF.font = [UIFont systemFontOfSize:14];
    self.idTF.textAlignment = NSTextAlignmentCenter;
    self.idTF.layer.borderWidth = 1;
    self.idTF.layer.borderColor = [UIColor colorWithRed:0/255.f green:0/255.f blue:0/255.f alpha:0.12].CGColor;
    self.idTF.layer.cornerRadius = 4;
    self.idTF.delegate = self;
    [idAndPwView addSubview:self.idTF];
    
    //비밀번호 텍스트 필드
    self.pwTF = [[UITextField alloc] init];
    self.pwTF.frame = CGRectMake(idLb.frame.size.width + 4, pwLb.frame.origin.y, idAndPwView.frame.size.width - pwLb.frame.size.width - 8, pwLb.frame.size.height);
    self.pwTF.placeholder = @"비밀번호를 입력해 주세요";
    self.pwTF.font = [UIFont systemFontOfSize:14];
    self.pwTF.textAlignment = NSTextAlignmentCenter;
    self.pwTF.layer.borderWidth = 1;
    self.pwTF.layer.borderColor = [UIColor colorWithRed:0/255.f green:0/255.f blue:0/255.f alpha:0.12].CGColor;
    self.pwTF.layer.cornerRadius = 4;
    self.pwTF.secureTextEntry = YES;
    self.pwTF.delegate = self;
    [idAndPwView addSubview:self.pwTF];
    
    //로그인 버튼
    UIButton *loginBtn = [[UIButton alloc] init];
    [loginBtn setTitle:@"로그인" forState:UIControlStateNormal];
    loginBtn.frame = CGRectMake(8, self.view.frame.size.height/3 - 43, (idAndPwView.frame.size.width/2) - 16, 35);
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [loginBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [idAndPwView addSubview:loginBtn];
    
    //회원가입 버튼
    UIButton *joinBtn = [[UIButton alloc] init];
    [joinBtn setTitle:@"회원가입" forState:UIControlStateNormal];
    joinBtn.frame = CGRectMake(idAndPwView.frame.size.width - (idAndPwView.frame.size.width/2) + 8, self.view.frame.size.height/3 - 43, (idAndPwView.frame.size.width/2) - 16, 35);
    joinBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [joinBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [idAndPwView addSubview:joinBtn];
    
    //로고 배경
    UIView *logoView = [[UIView alloc] init];
    logoView.frame = CGRectMake(32, 0, self.view.frame.size.width - 64,  self.view.frame.size.height/3);
    logoView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:logoView];
    
    //로고 라벨
    UILabel *logoLb = [[UILabel alloc] init];
    logoLb.frame = CGRectMake(0, 0, logoView.frame.size.width, logoView.frame.size.height);
    logoLb.text = @"MY Login Page";
    logoLb.font = [UIFont systemFontOfSize:24];
    logoLb.textAlignment = NSTextAlignmentCenter;
    logoLb.textColor = [UIColor colorWithDisplayP3Red:0/255.f green:0/255.f blue:0/255.f alpha:0.87];
    [logoView addSubview:logoLb];
}

//리턴시 키보드 숨김
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ( textField == self.pwTF){
    
        [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
        [textField resignFirstResponder];
    }else {
        [self.pwTF becomeFirstResponder];
        
    }
    
    return YES;
}

//외부영역 터치시 키보드 숨김, 스크롤뷰 내려가기
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    [self.view endEditing:YES];
}

//텍스트필드 처음 클릭시 스크롤뷰 올라가기
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self.scrollView setContentOffset:CGPointMake(0, 56) animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
