//
//  ViewController3.m
//  Example1024
//
//  Created by david on 2016. 10. 24..
//  Copyright © 2016년 david. All rights reserved.
//

#import "ViewController3.h"
#import "ViewControllerXib.h"

@interface ViewController3 ()
@property (weak, nonatomic) IBOutlet UIButton *presentButton;
@property (weak, nonatomic) IBOutlet UIButton *dismissButton;
@property UIModalTransitionStyle *modalTransitonStyle;

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)dismissAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)presentAction:(id)sender
{
    ViewControllerXib *v4 = [[ViewControllerXib alloc] initWithNibName:@"ViewControllerXib" bundle:nil];
    [v4 setModalTransitionStyle:UIModalTransitionStylePartialCurl];
    [self presentViewController:v4 animated:YES completion:nil];
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
