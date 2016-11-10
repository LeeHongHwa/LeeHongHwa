//
//  ViewController.m
//  TestBlockButton
//
//  Created by david on 2016. 11. 10..
//  Copyright © 2016년 david. All rights reserved.
//

#import "ViewController.h"
#import "sampleObject.h"

@interface ViewController ()

@property sampleObject *diffrentObject;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.diffrentObject = [[sampleObject alloc] init];
    
    [self.diffrentObject plusNumber:^NSInteger(NSInteger blockNumber) {
        return blockNumber;
    }];
    
}

- (IBAction)clickBlockButton:(UIButton *)sender
{
    ViewController * __weak weakSelf = self;
    NSLog(@"%ld", [weakSelf.diffrentObject playMethod:5]); 
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
