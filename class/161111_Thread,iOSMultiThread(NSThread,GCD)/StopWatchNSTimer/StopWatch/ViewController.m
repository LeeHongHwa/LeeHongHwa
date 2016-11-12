//
//  ViewController.m
//  StopWatch
//
//  Created by david on 2016. 11. 12..
//  Copyright © 2016년 david. All rights reserved.
//

#import "ViewController.h"
//전역 변수: 초
static NSInteger secondsCount = 0;

@interface ViewController ()
///초를 나타내는 label
@property (weak, nonatomic) IBOutlet UILabel *secondsLabel;
///스탑워치 버튼 (재생, 정지)
@property (weak, nonatomic) IBOutlet UIButton *stopWatchButton;
///timeThread
@property NSTimer *timer;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

/**
 NSTimer 객체 생성
 1초마다 plusOneSeconds method를 호출한다.
 */
- (void)createTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1
                                                  target:self
                                                selector:@selector(plusOneSeconds)
                                                userInfo:nil
                                                 repeats:YES];
}

/**
 1초씩 증가시켜서 secondsLabel 초를 표시한다.
 */
- (void)plusOneSeconds
{
    secondsCount += 1;
    self.secondsLabel.text = [NSString stringWithFormat:@"%ld", secondsCount];
}

/**
 스탑워치 버튼을 터치 했을때 호출되는 메서드
 */
- (IBAction)clickStopWatchButton:(UIButton *)sender
{
    //유효성 검사
    if ([sender isKindOfClass:[UIButton class]] == NO)
    {
        return;
    }
    
    //배경 색상 변경
    [self changeButtonBackgroundAnimation:sender];
    
    if (sender.selected == NO)
    {//시작
        sender.selected = YES;
        [self createTimer];
        [self.timer fire];
    } else
    {//정지
        sender.selected = NO;
        [self.timer invalidate];
        self.timer = nil;
    }
    
}

//배경 색상 변경 애니메이션
- (void)changeButtonBackgroundAnimation:(UIButton *)sender
{
    [UIView animateWithDuration:0.2f animations:^{
        [self buttonBackgroundColorIsSelected:sender];
    }];
}

//배경 색상 변경
- (void)buttonBackgroundColorIsSelected:(UIButton *)sender
{
    if (sender.selected == NO)
    {
        sender.backgroundColor = selectedOnBackgroundColor;
    } else
    {
        sender.backgroundColor = selectedOFFBackgroundColor;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
