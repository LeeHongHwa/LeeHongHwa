//
//  ViewController.m
//  Example0929
//
//  Created by david on 2016. 9. 29..
//  Copyright © 2016년 david. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//----------------------------------- UI 연습 1 ----------------------------------------
    
//    //UIView 객체 생성 X,Y,Width,Height
//    UIView *newView = [[UIView alloc] initWithFrame:CGRectMake(0,
//                                                               0,
//                                                               300,
//                                                               300)];
//    //UIView를 @class로 받은 UIColor
//    //newView.backgroundColor = [UIColor redColor];
//    //int형이라서 0이나오니 .f를 써야한다
//   newView.backgroundColor = [[UIColor alloc] initWithRed:100.f/255.f
//                                                    green:100.f/255.f
//                                                     blue:199.f/255.f
//                                                    alpha:1];
//    //newView.alpha = 0.5; = 부모의 알파값을 하위에게 상속
//    
//    //newView를 입양함
//    [self.view addSubview:newView];
//    
//    //UIView 객체 생성
//    UIView *newSubview = [[UIView alloc] initWithFrame:CGRectMake(100,
//                                                                  100,
//                                                                  100,
//                                                                  100)];
//    //UIView 배경 색상
//    newSubview.backgroundColor = [UIColor whiteColor];
//    
//    //입양
//    [newView addSubview:newSubview];
//    
//    //UIView 객체 생성
//    UIView *upView = [[UIView alloc] initWithFrame:CGRectMake(15,
//                                                              15,
//                                                              345,
//                                                              100)];
//    
//    //UIView 배경 색상
//    upView.backgroundColor = [UIColor blueColor];
//    
//    //입양
//    [self.view addSubview:upView];
//    
//    //UIView 객체 생성
//    UIView *downView = [[UIView alloc] initWithFrame:CGRectMake(15,
//                                                                553,
//                                                                345,
//                                                                100)];
//    //UIView 배경 색상
//    downView.backgroundColor = [UIColor blueColor];
//    
//    //입양
//    [self.view addSubview:downView];

//----------------------------------- UI 연습 2 ----------------------------------------

//    //UIView 객체생성
//    //self.view.frame.size.wdith = 가로값 구하기
//    //self.view.frame.size.height = 세로값 구하기
//     UIView *oneView = [[UIView alloc] initWithFrame:CGRectMake(15,
//                                                                15,
//                                                                self.view.frame.size.width - 30,
//                                                                self.view.frame.size.height - 30)];
//    oneView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:oneView];
//    
//    UIView *twoView = [[UIView alloc] initWithFrame:CGRectMake(15,
//                                                               15,
//                                                               oneView.frame.size.width - 30,
//                                                               oneView.frame.size.height - 30)];
//    twoView.backgroundColor = [UIColor blueColor];
//    [oneView addSubview:twoView];
//    
//    UIView *threeView = [[UIView alloc] initWithFrame:CGRectMake(15,
//                                                                 15,
//                                                                 twoView.frame.size.width - 30,
//                                                                 twoView.frame.size.height - 30)];
//    threeView.backgroundColor = [UIColor greenColor];
//    [twoView addSubview:threeView];

//----------------------------------- UI 연습 3 ----------------------------------------
    
//    UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0,
//                                                                      0,
//                                                                      self.view.frame.size.width,
//                                                                      self.view.frame.size.height)];
//    backgroundView.backgroundColor = [UIColor blackColor];
//    [self.view addSubview:backgroundView];
//    
//    UIView *baseView = [[UIView alloc] initWithFrame:CGRectMake(50,
//                                                                (backgroundView.frame.size.height - 160)/2,
//                                                                backgroundView.frame.size.width - 100,
//                                                                160)];
//    baseView.backgroundColor = [UIColor blackColor];
//    [backgroundView addSubview:baseView];
//    
//    UIView *leftSide = [[UIView alloc] initWithFrame:CGRectMake(0,
//                                                                0,
//                                                                20,
//                                                                160)];
//    leftSide.backgroundColor = [UIColor redColor];
//    [baseView addSubview:leftSide];
//    
//    UIView *rightSide = [[UIView alloc] initWithFrame:CGRectMake(baseView.frame.size.width - 20,
//                                                                 0,
//                                                                 20,
//                                                                 160)];
//    rightSide.backgroundColor = [UIColor yellowColor];
//    [baseView addSubview:rightSide];
//    
//    UIView *upSide = [[UIView alloc] initWithFrame:CGRectMake(0,
//                                                              0,
//                                                              baseView.frame.size.width,
//                                                              20)];
//    upSide.backgroundColor = [UIColor blueColor];
//    [baseView addSubview:upSide];
//    
//    UIView *downSide = [[UIView alloc] initWithFrame:CGRectMake(0,
//                                                                baseView.frame.size.height,
//                                                                baseView.frame.size.width,
//                                                                20)];
//    downSide.backgroundColor = [UIColor greenColor];
//    [baseView addSubview:downSide];

//----------------------------------- Frame 과 Bounds차이  ----------------------------------------
    //크기는 frame이랑 bounds랑 같지만 좌표를 가져오는 점에서 차이가 난다.
    //frame.orign은 부모의 좌표를 가져오지만 bounds는 0이다.
    UIView *superView = [[UIView alloc] initWithFrame:CGRectMake(15, 15, 200, 400)];
    superView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:superView];
    
    UIView *testForFrame = [[UIView alloc] initWithFrame:CGRectMake(30, 20, superView.frame.size.width, 15)];
    testForFrame.backgroundColor = [UIColor blueColor];
    [superView addSubview:testForFrame];
    
    UIView *testForFrame2 = [[UIView alloc] initWithFrame:CGRectMake(testForFrame.frame.origin.x, 20, superView.frame.size.width, 15)];
    testForFrame2.backgroundColor = [UIColor redColor];
    [testForFrame addSubview:testForFrame2];
    
    UIView *testForBounds = [[UIView alloc] initWithFrame:CGRectMake(60, 20, superView.bounds.size.width, 5)];
    testForBounds.backgroundColor = [UIColor greenColor];
    [superView addSubview:testForBounds];
    
    UIView *testForBounds2 = [[UIView alloc] initWithFrame:CGRectMake(testForBounds.bounds.origin.x, 20, superView.bounds.size.width, 5)];
    testForBounds2.backgroundColor = [UIColor yellowColor];
    [testForBounds addSubview:testForBounds2];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
