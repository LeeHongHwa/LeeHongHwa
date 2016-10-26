//
//  DismissViewController.m
//  Homework
//
//  Created by david on 2016. 10. 25..
//  Copyright © 2016년 david. All rights reserved.
//

#import "DismissViewController.h"

@interface DismissViewController ()

@end

@implementation DismissViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
//pesentModal Action(dismiss)
- (IBAction)dismissAction:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
