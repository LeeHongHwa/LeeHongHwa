//
//  ViewController.m
//  Login
//
//  Created by david on 2016. 10. 24..
//  Copyright © 2016년 david. All rights reserved.
//

#import "ViewController.h"
#import "SignupViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *signup;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

//viewController의 lifeCycle에 따라 화면전환
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    //view가 그려지기전에 navigationBar를 숨겨라
    self.navigationController.navigationBar.hidden = YES;
    
}
//버튼에 navigationController의 push메서드 호출
- (IBAction)pushAction:(UIButton *)sender {
    
    //UIStoryboard 객체 생성
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    //SignupViewController 객체 생성
    SignupViewController *signupViewController = [storyboard instantiateViewControllerWithIdentifier:@"signup"];
    //navigationController 에게 push를 부탁
    [self.navigationController pushViewController:signupViewController animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
