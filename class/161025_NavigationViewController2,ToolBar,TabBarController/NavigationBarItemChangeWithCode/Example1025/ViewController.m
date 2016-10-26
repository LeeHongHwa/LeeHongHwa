//
//  ViewController.m
//  Example1025
//
//  Created by david on 2016. 10. 25..
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
    // Do any additional setup after loading the view, typically from a nib.
    
//    [self.navigationController setNavigationBarHidden:YES];
    
    //custom barButton
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"다음" style:UIBarButtonItemStylePlain target:self action:@selector(onSelectedItem:)];
    
    //rightBarButtonItem 지정
    self.navigationItem.rightBarButtonItem = item;
    
}

//navigation Action(push)
- (void)onSelectedItem:(UIButton *)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController2 *v2 = [storyboard instantiateViewControllerWithIdentifier:@"v2"];
    [self.navigationController pushViewController:v2 animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
