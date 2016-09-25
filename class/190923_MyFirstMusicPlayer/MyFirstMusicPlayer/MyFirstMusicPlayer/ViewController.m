//
//  ViewController.m
//  MyFirstMusicPlayer
//
//  Created by david on 2016. 9. 23..
//  Copyright © 2016년 david. All rights reserved.
//

// 읽을 수 있는 코드를 주석으로 다 써보기 1주일에 한번

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
/**
 * viewController 클래스
 */
@interface ViewController () <AVAudioPlayerDelegate>

///자료형(AVAudioPlayer) 플레이어
@property AVAudioPlayer *player;

///자료형(UIButton)인 재생버튼
@property UIButton *playButton;

///자료형(UILabel) 재생시간표시
@property UILabel *timeLabel;

///자료형(NSTimer) ??
@property NSTimer *timer;

/**
 * reaturn 값이 없다
 * 메서드의 이름은 displayTime duration 이다
 * 파라미터로는 NSTimeInterval자료형인 currentTime(현재시간)과 duration(총시간)을 받는다
 * @param currentTime 현재 재생되고 있는 시간
 * @param duration 총 재생 시간
 */
- (void)displayTime:(NSTimeInterval)currentTime
        duration:(NSTimeInterval)duration;

@end

//------------------------------------------- 구현부 -----------------------------------------------

@implementation ViewController

//기능별 분리
#pragma mark - Life Cycle

//return 값이 없다
//super가 있는걸 보니 override한것 같다.
- (void)viewDidLoad {
    
    //부모 클래스의 viewDidLoad메서드를 실행 시키다.
    [super viewDidLoad];
    
    //자료형: CGRect
    //변수 이름: labelFrame, buttonFrame
    CGRect labelFrame = CGRectMake(30.0f, 30.0f, 250.f, 30.f);
    CGRect buttonFrame = CGRectMake(30.f, 70.f, 50.f, 30.f);
    
    //property(playButton)값 초기화
    //UIButton 자료형 할당 후 buttonFrame값으로 초기화
    self.playButton = [[UIButton alloc] initWithFrame:buttonFrame];
    
    [self.playButton setTitle:@"play" forState:UIControlStateNormal];
    
    [self.playButton setTitle:@"pause" forState:UIControlStateSelected];
    
    [self.playButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    [self.playButton setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    
    [self.playButton setBackgroundColor:[UIColor yellowColor]];
    
    [self.playButton addTarget:self
                        action:@selector(clickPlayButton:)
              forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.playButton];
    
    //property(timeLabel)값 초기화
    //UILabel 자료형 할당 후 labelFrame값으로 초기화
    self.timeLabel = [[UILabel alloc] initWithFrame:labelFrame];
    
    [self.timeLabel setTextColor:[UIColor brownColor]];
    [self.view addSubview:self.timeLabel];
    
    [self displayTime:0
             duration:0];
    

    NSURL *soundFileURL = [[NSBundle mainBundle] URLForResource:@"sound" withExtension:@"mp3"];
    
    //property(player)값 초기화
    //AVAudioPlayer 자료형 할당 후 soundFileURL값으로 초기화
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:nil];
    
    [self.player setDelegate:self];
    
}

#pragma mark - Display Something

- (void)displayTime:(NSTimeInterval)currentTime duration:(NSTimeInterval)duration {
    NSInteger currentMin = (NSInteger)(currentTime / 60.0);
    NSInteger currentSec = ((NSInteger)currentTime % 60);
    
    NSInteger durationMin = (NSInteger)(duration / 60.0);
    NSInteger durationSec = ((NSInteger)duration % 60);
    
    NSString *timeString = [[NSString alloc] initWithFormat:@"%02ld:%02ld / %02ld:%02ld", currentMin, currentSec, durationMin, durationSec];
    
    [self.timeLabel setText:timeString];
}

#pragma mark - Button Methods
/**
 * 플레이버튼클릭 메서드
 * UIButton 자료형인 property(sender)를 받는다
 */
- (void)clickPlayButton:(UIButton *)sender {
    [sender setSelected:!sender.selected];
    
    if (sender.isSelected == YES) {
        [self.player play];
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                                      target:self
                                                    selector:@selector(checkTime)
                                                    userInfo:nil
                                                     repeats:YES];
        [self.timer fire];
    } else {
        [self.player pause];
        [self.timer invalidate];
        self.timer = nil;
    }
    return;
}
- (void)checkTime {
    if ((self.player.duration > 0) && (self.player.currentTime > 0)) {
        [self displayTime:self.player.currentTime
                 duration:self.player.duration];
    }
    return;
}

#pragma mark - AVAudioPlayerDelegate Methods
/**
 * 오디오에러 메서드
 * AVAudioPlayer 자료형인 property(player)를 받는다
 * NSError 자료형인 property(error)를 받는다
 */
- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error {
    
    //UIAlertController 자료형 alert객체 = ??
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"알림"
                                                                   message:@"음원 파일을 제가 발생했습니다." preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"확인"
                                              style:UIAlertActionStyleDefault
                                            handler:nil]];
    
    [self presentViewController:alert
                       animated:YES
                     completion:^{
                         NSLog(@"decode error occured : %@", error.localizedDescription);
                     }];
}

/**
 * 오디오가 끝났을때
 * AVAudioPlayer 자료형인 property(player)를 받는다
 * BOOL 자료형인 property(flag)를 받는다
 */
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    
    //메서드를 호출하는 객체에게 메서드 호출
    [self displayTime:0
             duration:self.player.duration];
    [self.playButton setSelected:NO];
}

@end
