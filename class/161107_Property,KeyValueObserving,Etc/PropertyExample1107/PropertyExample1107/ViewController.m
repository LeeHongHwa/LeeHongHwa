//
//  ViewController.m
//  PropertyExample1107
//
//  Created by david on 2016. 11. 7..
//  Copyright © 2016년 david. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Person *yagom = [[Person alloc] init];
    [yagom setPersonName:@"yagom"];
    [yagom setAge:100];
    [yagom setWeight:75.5];
    
//    NSLog(@"이름 : %@, 나이 : %ld",[yagom p]);
    
    [yagom prinfPersonInfo];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
