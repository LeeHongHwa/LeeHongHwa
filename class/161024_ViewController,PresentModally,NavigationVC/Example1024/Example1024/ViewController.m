//
//  ViewController.m
//  Example1024
//
//  Created by david on 2016. 10. 24..
//  Copyright © 2016년 david. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *presentButton;
@property UIModalTransitionStyle *modalTransitonStyle;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
//present modally present method
- (IBAction)presentAction:(UIButton *)sender
{
    //스토리보드 저장
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    //viewConroller 저장
    ViewController2 *v2 = [storyboard instantiateViewControllerWithIdentifier:@"v2"];
    [v2 setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    [self presentViewController:v2 animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
