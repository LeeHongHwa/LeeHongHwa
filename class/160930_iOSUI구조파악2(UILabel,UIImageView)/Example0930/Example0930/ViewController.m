//
//  ViewController.m
//  Example0930
//
//  Created by david on 2016. 9. 30..
//  Copyright © 2016년 david. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property NSMutableArray *itemViews;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
//------------------------------------------ UILabel 연습 -----------------------------------------
    
    //    UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(15, 15, self.view.frame.size.width -30, self.view.frame.size.height)];
    //
    //    backgroundView.backgroundColor = [UIColor whiteColor];
    //
    //    [self.view addSubview:backgroundView];
    //
    //
    //    UIView *blackView = [[UIView alloc] initWithFrame:CGRectMake(0, 80, backgroundView.frame.size.width, (backgroundView.frame.size.height)/2 - 160)];
    //
    //    blackView.backgroundColor = [UIColor blackColor];
    //
    //    [backgroundView addSubview:blackView];
    //
    //    UILabel *firstUI = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, backgroundView.frame.size.width, 20)];
    //
    //    firstUI.text = @"예제 화면 입니다.";
    //    [backgroundView addSubview:firstUI];
    //
    //    UILabel *secondText = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, backgroundView.frame.size.width, 20)];
    //
    //    secondText.text = @"예쁜 레이블 입니다.";
    //    secondText.textColor = [UIColor redColor];
    //    [secondText setTextAlignment:NSTextAlignmentRight];
    //
    //    [backgroundView addSubview:secondText];
    //
    //    UILabel *thirdText = [[UILabel alloc] initWithFrame:CGRectMake(0, blackView.frame.size.height - 20, backgroundView.frame.size.width, 20)];
    //
    //    thirdText.text = @"view위에 레이블 입니다.";
    //    thirdText.textColor = [UIColor whiteColor];
    //    [thirdText setTextAlignment:NSTextAlignmentRight];
    //
    //    [blackView addSubview:thirdText];
    //
    //    UILabel *fourText = [[UILabel alloc] initWithFrame:CGRectMake(0, blackView.frame.size.height, backgroundView.frame.size.width, 60)];
    //
    //    fourText.text = @"중앙에 있는 레이블 입니다.";
    //    fourText.textColor = [UIColor blackColor];
    //    [fourText setTextAlignment:NSTextAlignmentCenter];
    //
    //    [blackView addSubview:fourText];
    //
    //    UILabel *five = [[UILabel alloc] initWithFrame:CGRectMake(0, blackView.frame.size.height + fourText.frame.size.height, backgroundView.frame.size.width, 60)];
    //
    //    five.text = @"폰트는 20입니다.";
    //    five.textColor = [UIColor blackColor];
    //    five.font = [UIFont systemFontOfSize:20];
    //    [five setTextAlignment:NSTextAlignmentCenter];
    //    
    //    [blackView addSubview:five];

//----------------------------------------------- 자판기 UI -------------------------------------------------
    
    //BGView
    UIView *BGView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];

    BGView.backgroundColor = [[UIColor alloc] initWithRed:250/255.f green:250/255.f blue:250/255.f alpha:1];
    
    [self.view addSubview:BGView];
    
    //navigationView
    UIView *navigationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, BGView.frame.size.width, 74)];
    
    navigationView.backgroundColor = [[UIColor alloc] initWithRed:82/255.f green:53/255.f blue:56/255.f alpha:1];
    
    [BGView addSubview:navigationView];
    
    //tabView
    UIView *tabView = [[UIView alloc] initWithFrame:CGRectMake(0, BGView.frame.size.height - 58, BGView.frame.size.width, 58)];
    
    tabView.backgroundColor = [[UIColor alloc] initWithRed:247/255.f green:247/255.f blue:247/255.f alpha:1];
    
    [BGView addSubview:tabView];
    
    //inputView
    UIView *inputView = [[UIView alloc] initWithFrame:CGRectMake(0, navigationView.frame.size.height, BGView.frame.size.width, 52)];
    
    inputView.backgroundColor = [[UIColor alloc] initWithRed:238/255.f green:238/255.f blue:238/255.f alpha:1];
    
    [BGView addSubview:inputView];
    
    //imgContainerView
    UIView *imgContainerView = [[UIView alloc] initWithFrame:CGRectMake(12, inputView.frame.size.height + 12, BGView.frame.size.width - 24, BGView.frame.size.width - 24)];
    
    imgContainerView.backgroundColor = [UIColor clearColor];
    
    [inputView addSubview:imgContainerView];
    
    //BItemView
    UIView *BItemView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, (imgContainerView.frame.size.width/2)-4, (imgContainerView.frame.size.width /2)-4)];
    
    BItemView.backgroundColor = [[UIColor alloc] initWithRed:242/255.f green:242/255.f blue:242/255.f alpha:1];
    
    [imgContainerView addSubview:BItemView];
    
    //DitemView
    UIView *DItemView = [[UIView alloc] initWithFrame:CGRectMake(imgContainerView.frame.size.width - BItemView.frame.size.width, 0, (imgContainerView.frame.size.width / 2)-4, (imgContainerView.frame.size.width /2)-4)];
    
    DItemView.backgroundColor = [[UIColor alloc] initWithRed:242/255.f green:242/255.f blue:242/255.f alpha:1];
    
    [imgContainerView addSubview:DItemView];
    
    //SItemView
    UIView *SItemView = [[UIView alloc] initWithFrame:CGRectMake(0, imgContainerView.frame.size.width - BItemView.frame.size.width, (imgContainerView.frame.size.width / 2)-4, (imgContainerView.frame.size.width /2)-4)];
    
    SItemView.backgroundColor = [[UIColor alloc] initWithRed:242/255.f green:242/255.f blue:242/255.f alpha:1];
    
    [imgContainerView addSubview:SItemView];
    
    //TItemView
    UIView *TItemView = [[UIView alloc] initWithFrame:CGRectMake(imgContainerView.frame.size.width - BItemView.frame.size.width, imgContainerView.frame.size.width - BItemView.frame.size.width, (imgContainerView.frame.size.width / 2)-4, (imgContainerView.frame.size.width / 2)-4)];
    
    TItemView.backgroundColor = [[UIColor alloc] initWithRed:242/255.f green:242/255.f blue:242/255.f alpha:1];
    
    [imgContainerView addSubview:TItemView];
    
    //costDisplayView
    UIView *costDisplayView = [[UIView alloc] initWithFrame:CGRectMake(0, imgContainerView.frame.size.width+12, imgContainerView.frame.size.width, 50)];
    
    costDisplayView.backgroundColor = [[UIColor alloc] initWithRed:33/255.f green:33/255.f blue:33/255.f alpha:1];
    
    [imgContainerView addSubview:costDisplayView];
    
    //BIamgeView
    UIImageView *BIamgeView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, BItemView.frame.size.width, BItemView.frame.size.width)];
    
    BIamgeView.image = [UIImage imageNamed:@"brain"];
    
    [BIamgeView setContentMode:UIViewContentModeScaleAspectFit];
    
    [BItemView addSubview:BIamgeView];
    
    //DIamgeView
    UIImageView *DIamgeView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, BItemView.frame.size.width, BItemView.frame.size.width)];
    
    DIamgeView.image = [UIImage imageNamed:@"design"];
    
    [DIamgeView setContentMode:UIViewContentModeScaleAspectFit];
    
    [DItemView addSubview:DIamgeView];
    
    //SIamgeView
    UIImageView *SIamgeView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, BItemView.frame.size.width, BItemView.frame.size.width)];
    
    SIamgeView.image = [UIImage imageNamed:@"sports"];
    
    [SIamgeView setContentMode:UIViewContentModeScaleAspectFit];
    
    [SItemView addSubview:SIamgeView];
    
    //TIamgeView
    UIImageView *TIamgeView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, BItemView.frame.size.width, BItemView.frame.size.width)];
    
    TIamgeView.image = [UIImage imageNamed:@"travel"];
    
    [TIamgeView setContentMode:UIViewContentModeScaleAspectFit];
    
    [TItemView addSubview:TIamgeView];
    
    //BLabelView
    UILabel *BLabelView = [[UILabel alloc] initWithFrame:CGRectMake(0, BItemView.frame.size.width - 20, BItemView.frame.size.width, 20)];
    BLabelView.text = @"1000원";
    BLabelView.textColor = [[UIColor alloc] initWithRed:66/255.f green:66/255.f blue:66/255.f alpha:1];
    
    [BLabelView setTextAlignment:NSTextAlignmentCenter];
    
    [BItemView addSubview:BLabelView];
    
    //DLabelView
    UILabel *DLabelView = [[UILabel alloc] initWithFrame:CGRectMake(0, BItemView.frame.size.width - 20, BItemView.frame.size.width, 20)];
    
    DLabelView.text = @"800원";
    
    DLabelView.textColor = [[UIColor alloc] initWithRed:66/255.f green:66/255.f blue:66/255.f alpha:1];
    
    [DLabelView setTextAlignment:NSTextAlignmentCenter];
    
    [DItemView addSubview:DLabelView];
    
    //SLabelView
    UILabel *SLabelView = [[UILabel alloc] initWithFrame:CGRectMake(0, BItemView.frame.size.width - 20, BItemView.frame.size.width, 20)];
    
    SLabelView.text = @"1500원";
    
    SLabelView.textColor = [[UIColor alloc] initWithRed:66/255.f green:66/255.f blue:66/255.f alpha:1];
    
    [SLabelView setTextAlignment:NSTextAlignmentCenter];
    
    [SItemView addSubview:SLabelView];
    
    //TLabelView
    UILabel *TLabelView = [[UILabel alloc] initWithFrame:CGRectMake(0, BItemView.frame.size.width - 20, BItemView.frame.size.width, 20)];
    
    TLabelView.text = @"500원";
    
    TLabelView.textColor = [[UIColor alloc] initWithRed:66/255.f green:66/255.f blue:66/255.f alpha:1];
    
    [TLabelView setTextAlignment:NSTextAlignmentCenter];
    
    [TItemView addSubview:TLabelView];
    
    //costDisplayLabelView
    UILabel *costDisplayLabelView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, costDisplayView.frame.size.width-30, costDisplayView.frame.size.height)];
    
    costDisplayLabelView.text = @"잔액: 0원";
    
    costDisplayLabelView.textColor = [UIColor whiteColor];
    
    costDisplayLabelView.font = [UIFont systemFontOfSize:24];
    
    [costDisplayLabelView setTextAlignment:NSTextAlignmentRight];
    
    [costDisplayView addSubview:costDisplayLabelView];
    
    //buttonOne
    UIButton *buttonOne = [[UIButton alloc] initWithFrame:CGRectMake(8, 0, inputView.frame.size.width/3, inputView.frame.size.height)];
    
    [buttonOne addTarget:self action:@selector(onTouchupInsideCoin:) forControlEvents:UIControlEventTouchUpInside];
    
    [buttonOne setTitle:@"1000원" forState:UIControlStateNormal];
    
    [buttonOne setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    [buttonOne setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    [inputView addSubview:buttonOne];
    
    //buttonTwo
    UIButton *buttonTwo = [[UIButton alloc] initWithFrame:CGRectMake((inputView.frame.size.width)/2 - (inputView.frame.size.width/3)/2, 0, inputView.frame.size.width/3, inputView.frame.size.height)];
    
    [buttonTwo addTarget:self action:@selector(onTouchupInsideCoin:) forControlEvents:UIControlEventTouchUpInside];
    
    [buttonTwo setTitle:@"500원" forState:UIControlStateNormal];
    
    [buttonTwo setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    [buttonTwo setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    [inputView addSubview:buttonTwo];
    
    //buttonTree
    UIButton *buttonThree = [[UIButton alloc] initWithFrame:CGRectMake(inputView.frame.size.width - inputView.frame.size.width/3, 0, inputView.frame.size.width/3, inputView.frame.size.height)];
    
    [buttonThree addTarget:self action:@selector(onTouchupInsideCoin:) forControlEvents:UIControlEventTouchUpInside];
    
    [buttonThree setTitle:@"100원" forState:UIControlStateNormal];
    
    [buttonThree setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    
    [buttonThree setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    [inputView addSubview:buttonThree];
    
    //imgButtonOne
    UIButton *imgButtonOne = [UIButton buttonWithType:UIButtonTypeCustom];
    imgButtonOne.frame = CGRectMake(0, 0, BItemView.frame.size.width, BItemView.frame.size.width);
    
    //누구에게 어떠한 액션을 무슨 행동을 했을경우에 할지를 정의
    [imgButtonOne addTarget:self action:@selector(onTouchupInsideCoin:) forControlEvents:UIControlEventTouchUpInside];
    
    //찾아보기 superView의 크기를 상속받는다
    imgButtonOne.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [BItemView addSubview:imgButtonOne];
    
//    UIButton *imgButtonOne = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, BItemView.frame.size.width, BItemView.frame.size.width)];
//    
//    [imgButtonOne addTarget:self action:@selector(onTouchupInsideItem:) forControlEvents:UIControlEventTouchUpInside];
//    
//    [BLabelView addSubview:imgButtonOne];
//    
    //imgButtonTwo
    UIButton *imgButtonTwo = [[UIButton alloc] initWithFrame:CGRectMake(0, BItemView.frame.size.width - 20, BItemView.frame.size.width, 20)];
    
    [imgButtonTwo addTarget:self action:@selector(onTouchupInsideItem:) forControlEvents:UIControlEventTouchUpInside];
    
    [DIamgeView addSubview:imgButtonTwo];
    
    //imgButtonThree
    UIButton *imgButtonThree = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, BItemView.frame.size.width, BItemView.frame.size.width)];
    
    [imgButtonThree addTarget:self action:@selector(onTouchupInsideItem:) forControlEvents:UIControlEventTouchUpInside];
    
    [SIamgeView addSubview:imgButtonThree];
    
    //imgButtonFour
    UIButton *imgButtonFour = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, BItemView.frame.size.width, BItemView.frame.size.width)];
    
    
    [imgButtonFour addTarget:self action:@selector(onTouchupInsideItem:) forControlEvents:UIControlEventTouchUpInside];
    
    [TIamgeView addSubview:imgButtonFour];

}

- (void)onTouchupInsideCoin:(UIButton *)sender {
    NSLog(@"input 버튼을 눌렀습니다");
}
- (void)onTouchupInsideItem:(UIButton *)sender {
    NSLog(@"item 버튼을 눌렀습니다");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
