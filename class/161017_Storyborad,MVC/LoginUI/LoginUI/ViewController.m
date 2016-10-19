//
//  ViewController.m
//  LoginUI
//
//  Created by david on 2016. 10. 17..
//  Copyright © 2016년 david. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

//스토리보드의 객체와 연결
@property (weak, nonatomic) IBOutlet UILabel *loginTitle;
@property (weak, nonatomic) IBOutlet UITextField *idTF;
@property (weak, nonatomic) IBOutlet UITextField *pwTF;
@property (weak, nonatomic) IBOutlet UIButton *autoLogin;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
//로그인 버튼을 누를때 호출하는 메서드 (아이디의 텍스트를 alert창에 출력)
//sender같은건 어디있지???
- (IBAction)loginAlert:(id)sender
{
            UIAlertController *loginAlert = [UIAlertController alertControllerWithTitle:@"로그인" message:[NSString stringWithFormat:@"%@로 로그인이 완료되었습니다.",self.idTF.text] preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okBtn = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleCancel handler:nil];
    [loginAlert addAction:okBtn];
    [self presentViewController:loginAlert animated:YES completion:Nil];
}
//체크박스 버튼 메서드
- (IBAction)checkBtn:(id)sender {
    if ([sender isKindOfClass:[UIButton class]]) {
        UIButton *btn = (UIButton *)sender;
        btn.selected = !btn.selected;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
