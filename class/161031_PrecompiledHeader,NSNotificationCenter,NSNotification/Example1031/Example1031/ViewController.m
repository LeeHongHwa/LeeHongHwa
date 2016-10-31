//
//  ViewController.m
//  Example1031
//
//  Created by david on 2016. 10. 31..
//  Copyright © 2016년 david. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[MySingleton sharedInstance] justMethod];
    //전역, 노티앞에 대문자, C언어는 대문자
    NSLog(@"%@", MyName);

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
