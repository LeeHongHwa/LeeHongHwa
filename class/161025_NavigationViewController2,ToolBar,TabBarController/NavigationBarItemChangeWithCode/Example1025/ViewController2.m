//
//  ViewController2.m
//  Example1025
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

    //custom barButton을 위한 UIButton 객체 생성
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setTitle:@"뒤로" forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(popAction:) forControlEvents:UIControlEventTouchUpInside];
    [backButton setTitleColor:[UIColor colorWithRed:33.f/255.f green:33.f/255.f blue:33.f/255.f alpha:1.0] forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor colorWithRed:33.f/255.f green:33.f/255.f blue:33.f/255.f alpha:0.54] forState:UIControlStateSelected];
    backButton.frame = CGRectMake(0, 0, 80, 44);
    [backButton setTitleColor:[UIColor colorWithRed:33.f/255.f green:33.f/255.f blue:33.f/255.f alpha:0.54] forState:UIControlStateHighlighted];
    backButton.frame = CGRectMake(0, 0, 80, 44);
    
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
//    self.navigationItem.backBarButtonItem = leftBarButton;
    //leftBarButtonItem 설정
    self.navigationItem.leftBarButtonItem = leftBarButton;
    //rightBarButtonItem 설정
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(pushAction:)];
}

//navigation Action(push)
- (void)pushAction:(UIButton *)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController3 *v3 = [storyboard instantiateViewControllerWithIdentifier:@"v3"];
    [self.navigationController pushViewController:v3 animated:YES];
}

//navigation Action(pop)
- (void)popAction:(UIButton *)sender
{
    if ([sender isKindOfClass:[UIButton class]])
    {
        UIButton *button = sender;
        if (button.selected)
        {
            button.selected = NO;
        } else
        {
            button.selected = YES;
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
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
