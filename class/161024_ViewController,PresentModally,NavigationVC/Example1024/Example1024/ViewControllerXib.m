//
//  ViewControllerXib.m
//  Example1024
//
//  Created by david on 2016. 10. 24..
//  Copyright © 2016년 david. All rights reserved.
//

#import "ViewControllerXib.h"
#import "ViewController2.h"

@interface ViewControllerXib ()


@property (weak, nonatomic) IBOutlet UIButton *dismissButton;

@end

@implementation ViewControllerXib

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    NSLog(@"XIB viewWillLayoutSubviews");
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    NSLog(@"XIB viewDidLayoutSubviews");
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    NSLog(@"XIB viewWillAppear");
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    NSLog(@"XIB viewDidAppear");
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    NSLog(@"XIB viewWillDisappear");
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:YES];
    NSLog(@"XIB viewDidDisappear");
}
- (IBAction)dismissAction:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning
{
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
