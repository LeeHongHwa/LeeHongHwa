//
//  ViewController3.m
//  Example1025
//
//  Created by david on 2016. 10. 25..
//  Copyright © 2016년 david. All rights reserved.
//

#import "ViewController3.h"

@interface ViewController3 ()

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //custom barButton을 위한 UISegmentedControl 객체 생성
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"one", @"two", @"three", nil]];
    [segmentedControl addTarget:self action:@selector(popAction:) forControlEvents:UIControlEventValueChanged];
    segmentedControl.frame = CGRectMake(0, 0, 90, 35);
    segmentedControl.selectedSegmentIndex = 0;
    segmentedControl.frame = CGRectMake(0, 0, 200, 32);
    
    //titleView 갑 설정
    self.navigationItem.titleView = segmentedControl;
    
    
    // Do any additional setup after loading the view.
}

//navigation Action(pop)
- (void)popAction:(UIButton *)sender
{
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
