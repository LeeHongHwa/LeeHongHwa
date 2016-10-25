//
//  ViewController.m
//  testController
//
//  Created by david on 2016. 10. 24..
//  Copyright © 2016년 david. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *pushButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}
//버튼에 push메서드 호출 추가
- (IBAction)pushAction:(UIButton *)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController2 *v2 = [storyboard instantiateViewControllerWithIdentifier:@"Screen2"];
    [self.navigationController pushViewController:v2 animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
