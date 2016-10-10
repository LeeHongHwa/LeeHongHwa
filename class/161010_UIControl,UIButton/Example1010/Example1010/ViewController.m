//
//  ViewController.m
//  Example1010
//
//  Created by david on 2016. 10. 10..
//  Copyright © 2016년 david. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property NSArray *btnTitle;

@property NSMutableArray *numBtns;

@property UIButton *beforeBtn;

@property UILabel *displayLb;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //왜여기에 만들어야되는지?
    //메인 뷰가 만들어진 다음

//----------------------------------- UIButton 연습 1 ----------------------------------------
//    UIButton *okBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    okBtn.frame = CGRectMake(30, 50, 100, 35);
//    
//    [okBtn setTitle:@"normal" forState:UIControlStateNormal];
//    [okBtn setTitle:@"hightlighted" forState:UIControlStateHighlighted];
//    [okBtn setTitle:@"selected" forState:UIControlStateSelected];
//    
//    [okBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//    [okBtn setTitleColor:[UIColor purpleColor] forState:UIControlStateHighlighted];
//    
//    okBtn.titleLabel.font = [UIFont systemFontOfSize:30];
//    okBtn.tag = 10;
//    
//    [okBtn addTarget:self action:@selector(touchUpInsideOKBtn:) forControlEvents:UIControlEventTouchUpInside];
    
//    [self.view addSubview:okBtn];
//    
//    UIButton *testBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    testBtn.frame = CGRectMake(100, 100, 200, 200);
//    
//    [testBtn setTitle:@"normal redColor" forState:UIControlStateNormal];
//    [testBtn setTitle:@"highlight blueColor" forState:UIControlStateHighlighted];
//    [testBtn setTitle:@"selected greenColor" forState:UIControlStateSelected];
//    
//    [testBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//    [testBtn setTitleColor:[UIColor greenColor] forState:UIControlStateSelected];
//    [testBtn setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
//    
//    //이벤트를 시작하는데 이 액션은 어디있느냐
//    [testBtn addTarget:self action:@selector(testTouch:) forControlEvents:UIControlEventTouchUpInside];
//    
//    testBtn.titleLabel.font = [UIFont systemFontOfSize:20];
//    
//    [self.view addSubview:testBtn];
//    
//
//}
//----------------------------------- UIButton 연습 2 ----------------------------------------
//    UIView *BGView = [[UIView alloc] initWithFrame:CGRectMake(32, (self.view.frame.size.height/2) - 68, self.view.frame.size.width - 64, 136)];
//    BGView.backgroundColor = [UIColor clearColor];
//    
//    [self.view addSubview:BGView];
//    self.btnTitle = @[@"1번 버튼", @"2번 버튼", @"3번 버튼", @"4번 버튼"];
//    
//    self.numBtns = [[NSMutableArray alloc] init];
//    
//    for (NSInteger i = 0; i < self.btnTitle.count; i += 1) {
//        UIButton *numBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        [numBtn setTitle:self.btnTitle[i] forState:UIControlStateNormal];
//        numBtn.backgroundColor = [UIColor blueColor];
//        [numBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [numBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
//        [numBtn addTarget:self action:@selector(changeBtnColor:) forControlEvents:UIControlEventTouchUpInside];
//        numBtn.tag = i;
//        
//        [BGView addSubview:numBtn];
//        
//        [self.numBtns addObject:numBtn];
//        
//    }
//    
//    for (UIButton *numBtns in self.numBtns) {
//        
//        NSInteger row = numBtns.tag/2;
//        NSInteger cal = numBtns.tag%2;
//        numBtns.frame = CGRectMake(((BGView.frame.size.width / 2) + 8) * cal, 82 * row, (BGView.frame.size.width / 2) - 8, 50);
//        
//        
//    }
//    
//    self.displayLb = [[UILabel alloc] init];
//    
//    self.displayLb.frame = CGRectMake(0 , BGView.frame.origin.y + BGView.frame.size.height + 16, self.view.frame.size.width, 80);
//    [self.displayLb setTextAlignment:NSTextAlignmentCenter];
//    [self.view addSubview:self.displayLb];
//----------------------------------- UISlider 연습 1 ----------------------------------------
//    UISlider *firstSlider = [[UISlider alloc] initWithFrame:CGRectMake(16, 0, self.view.frame.size.width - 32, 200)];
//    [self.view addSubview:firstSlider];
//    firstSlider.thumbTintColor = [UIColor blueColor]; //동그라미색상
//    firstSlider.value = 10; //분할
//    firstSlider.maximumValue = 10; //끝
//    firstSlider.minimumValue = 5; //시작점
//
//    firstSlider.maximumTrackTintColor = [UIColor brownColor];//남은것
//    firstSlider.minimumTrackTintColor = [UIColor greenColor];//선택한것
//    
//    [firstSlider addTarget:self action:@selector(firstTargetF:) forControlEvents:UIControlEventValueChanged];
//}
//- (void)changeBtnColor:(UIButton *)sender
//{
//    //눌린 버튼을 눌렀느냐
//        if (sender.selected)
//        {
//            sender.selected = NO;
//            self.beforeBtn = nil;
//            
//          self.displayLb.text = @"버튼을 누르지 않은 상태입니다";
//
//        }else {
//            self.beforeBtn.selected = NO;
//            
//            NSString *text = sender.titleLabel.text;
//            self.displayLb.text = text;
//
//            sender.selected = YES;
//            self.beforeBtn = sender;
//        }
    
}
- (void)firstTargetF:(UISlider *)sender {
    
    NSLog(@"%lf",sender.value);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
