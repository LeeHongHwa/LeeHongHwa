//
//  ViewController.m
//  KeyboardNotification
//
//  Created by david on 2016. 10. 31..
//  Copyright © 2016년 david. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *keyboardStateLB;
@property (weak, nonatomic) IBOutlet UILabel *keyboardFrameLB;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //키보드가 올라갔을 경우
    //나의 method naming didRecieveDidCheckKeyboardFrameDidKeyboardShowNotification
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceiveKeyboardChangeNotification:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    
    //키보드가 내려갔을 경우
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceiveKeyboardChangeNotification:)
                                                 name:UIKeyboardDidHideNotification
                                               object:nil];
    //키보드가 바뀔경우
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceiveKeyboardChangeNotification:)
                                                 name:UIKeyboardDidChangeFrameNotification
                                               object:nil];
}
/**
 키보드를 내리는 메서드
 subview의 firstResponder를 check후 endEditing해준다
 */
- (IBAction)tabBackground:(UITapGestureRecognizer *)sender
{
    for (UIView *subview in [self.view subviews]) {
        if ([subview isFirstResponder])
        {
            [subview endEditing:YES];
        }
    }
}

/**
 notification의 name에 따라서 상황에 따른 메서드실행 및 notification에 있는 userInfo 사용
 system notification name을 찾을때 연관있는 클래스에서 notification을 검색
 */
- (void)didReceiveKeyboardChangeNotification:(NSNotification *)noti
{
    //키보드가 보여질 때
    if ([noti.name isEqualToString:UIKeyboardDidShowNotification])
    {
        self.keyboardStateLB.text = @"키보드 있음";
    //키보드가 사라질 때
    } else if ([noti.name isEqualToString:UIKeyboardDidHideNotification])
    {
        self.keyboardStateLB.text = @"키보드 없음";
    //키보드의 frame이 변경될 때
    } else if ([noti.name isEqualToString:UIKeyboardDidChangeFrameNotification])
    {
        //NSValue는 primitiveType을 refrenceType으로 변경
        NSValue *userInfo = [noti.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
        CGRect keyboardFrame = [userInfo CGRectValue];
        self.keyboardFrameLB.text = NSStringFromCGRect(keyboardFrame);
    }
    
}


//_____ 내코드
//- (void)didRecieveDidCheckKeyboardFrameDidKeyboardShowNotification:(NSNotification *)noti
//{
//    NSDictionary *keyboardInfo = [noti userInfo];
//    NSValue *keyboardFrameBegin = [keyboardInfo valueForKey:UIKeyboardFrameBeginUserInfoKey];
//    CGRect keyboardFrameBeginRect = [keyboardFrameBegin CGRectValue];
//    self.keyboardFrameLB.text = NSStringFromCGRect(keyboardFrameBeginRect);
//    self.keyboardStateLB.text = @"키보드 있음";
//}
//
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    [self.view endEditing:YES];
//    self.keyboardStateLB.text = @"키보드 없음";
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
