//
//  ViewController.m
//  GestureRecognizerTest
//
//  Created by david on 2016. 10. 27..
//  Copyright © 2016년 david. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
///탭 횟수 Label
@property (weak, nonatomic) IBOutlet UILabel *checkTabNumberLB;
///좌표 횟수 Label
@property (weak, nonatomic) IBOutlet UILabel *checkOriginLB;
///rootView gesture
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *RootViewTabGesture;
///탭 횟수
@property NSInteger checkTabNumber;
///탭의 좌표
@property CGPoint checkOrigin;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)checkTouchNumber:(id)sender
{
    //탭 횟수
    self.checkTabNumber += self.RootViewTabGesture.numberOfTouches;
    //탭 횟수 label에 저장
    self.checkTabNumberLB.text = [NSString stringWithFormat:@"%ld", self.checkTabNumber];
    //좌표 값
    self.checkOrigin = [self.RootViewTabGesture locationInView:self.view];
    //좌표 값 label에 저장
    self.checkOriginLB.text = [NSString stringWithFormat:@"(%0.1lf, %0.1lf)", self.checkOrigin.x, self.checkOrigin.y];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
