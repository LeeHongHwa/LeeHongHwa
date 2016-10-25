//
//  ViewController2.m
//  Example1024
//
//  Created by david on 2016. 10. 24..
//  Copyright © 2016년 david. All rights reserved.
//

#import "ViewController2.h"
#import "ViewController3.h"

@interface ViewController2 ()
@property (weak, nonatomic) IBOutlet UIButton *presentButton;
@property (weak, nonatomic) IBOutlet UIButton *dismissButton;

@end

@implementation ViewController2


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//- (void)viewWillLayoutSubviews
//{
//    [super viewWillLayoutSubviews];
//    NSLog(@"viewWillLayoutSubviews");
//}
//
//- (void)viewDidLayoutSubviews
//{
//    [super viewDidLayoutSubviews];
//    NSLog(@"viewDidLayoutSubviews");
//}
//
//- (void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:YES];
//    NSLog(@"viewWillAppear");
//}
//
//- (void)viewDidAppear:(BOOL)animated
//{
//    [super viewDidAppear:YES];
//    NSLog(@"viewDidAppear");
//}
//
//- (void)viewWillDisappear:(BOOL)animated
//{
//    [super viewWillDisappear:YES];
//    NSLog(@"viewWillDisappear");
//}
//
//- (void)viewDidDisappear:(BOOL)animated
//{
//    [super viewDidDisappear:YES];
//    NSLog(@"viewDidDisappear");
//}
//
//present modally dismiss method
- (IBAction)dismissAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
//나내려줘
//- (IBAction)onTouchupInsideDismissBtn:(id)sender
//{
////    [self dismissViewControllerAnimated:YES completion:nil];
//    [self.navigationController popViewControllerAnimated:YES];
//}
- (IBAction)presentAction:(id)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController3 *v3 = [storyboard instantiateViewControllerWithIdentifier:@"v3"];
    [self presentViewController:v3 animated:YES completion:nil];
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
