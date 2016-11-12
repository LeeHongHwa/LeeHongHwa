//
//  ViewController.m
//  stopWatchGCD
//
//  Created by david on 2016. 11. 12..
//  Copyright © 2016년 david. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
///초 라벨
@property (weak, nonatomic) IBOutlet UILabel *secondsLabel;
///timer dispatch_source_t timer
@property (nonatomic)dispatch_source_t timerDispatchSource;
///block 내에서 쓰일 초
@property (nonatomic, assign)__block NSInteger seconds;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    //초 초기화
    self.seconds = 0;
}

//스탑워치 버튼(시작, 정지)
- (IBAction)clickStopwatchButton:(UIButton *)sender
{
    //유효성 검사
    if ([sender isKindOfClass:[UIButton class]] == NO)
    {
        return;
    }
    
    if (sender.selected == NO)
    {//ON
        sender.selected = YES;
        if (_timerDispatchSource == nil)
        {//dispatch_source가 없다면
            //dispatch_source 이벤트가 발생하면 dispatch_main_queue에게 전달한다
            self.timerDispatchSource = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
            
            dispatch_source_set_timer(_timerDispatchSource, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 1 * NSEC_PER_SEC);
            
            dispatch_source_set_event_handler(_timerDispatchSource, ^{
                self.seconds += 1;
                self.secondsLabel.text = [NSString stringWithFormat:@"%ld", _seconds];
            });
            
            dispatch_resume(_timerDispatchSource);
            
        } else
        {//dispatch_source가 있다면
            dispatch_resume(_timerDispatchSource);
        }
        
    } else
    {//OFF
        sender.selected = NO;
        dispatch_suspend(_timerDispatchSource);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
