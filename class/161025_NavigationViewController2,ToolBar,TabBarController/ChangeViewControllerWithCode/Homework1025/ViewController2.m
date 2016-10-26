//
//  ViewController2.m
//  Homework1025
//
//  Created by david on 2016. 10. 25..
//  Copyright © 2016년 david. All rights reserved.
//

#import "ViewController2.h"
#import "ViewController3.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //customBarItem을 위한 pushButton 생성
    UIButton *pushButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [pushButton addTarget:self action:@selector(pushAction:) forControlEvents:UIControlEventTouchUpInside];
    [pushButton setTitle:@"다음" forState:UIControlStateNormal];
    [pushButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    pushButton.frame = CGRectMake(0, 0, 50, 32);
    
    //uibarbuttonitem 생성
    UIBarButtonItem *pushBarButton = [[UIBarButtonItem alloc] initWithCustomView:pushButton];
    
    //navi.navigationItem.rightBarButtonItem 생성
    self.navigationItem.rightBarButtonItem = pushBarButton;
    
    
    
    
}
- (void)pushAction:(UIButton *)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController3 *v3 = [storyboard instantiateViewControllerWithIdentifier:@"v3"];
    [self.navigationController pushViewController:v3 animated:YES];
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
