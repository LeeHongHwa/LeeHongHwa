//
//  ViewController.m
//  Example1018
//
//  Created by david on 2016. 10. 18..
//  Copyright © 2016년 david. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//스토리보드 객체 연결
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *HHwidthValue;
@property (weak, nonatomic) IBOutlet UIStepper *HHcontrollViewWidth;
@property (weak, nonatomic) IBOutlet UIView *HHdpView;
@property (weak, nonatomic) IBOutlet UILabel *HHdpViewWidth;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

/**
 stepper를 통한 view width 변경
 */
- (IBAction)changeViewWidth:(id)sender {
    
    if ([sender isKindOfClass:[UIStepper class]]) {
        UIStepper *tempStepper = sender;
        double changedWidth = tempStepper.value;
        self.HHdpViewWidth.text = [NSString stringWithFormat:@"%ld",(NSInteger)changedWidth];
        //Constant값을 지정
        [self.HHwidthValue setConstant:changedWidth];
        //reset
        [self.HHdpView setNeedsLayout];
    }
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
