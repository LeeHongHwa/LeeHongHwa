//
//  ViewController.m
//  VendingMachine
//
//  Created by youngmin joo on 2016. 9. 30..
//  Copyright © 2016년 WingsCompany. All rights reserved.
//

#import "ViewController.h"
#import "ItemView.h"

@interface ViewController ()<ItemViewDelegate>

@property (nonatomic) NSArray *itemImgName;
@property (nonatomic) NSArray *itemData;
@property (nonatomic) NSArray *costData;

@property (nonatomic, weak) UIView *itemContainerView;
@property (nonatomic) NSMutableArray *itemViews;


@property (nonatomic, weak) UIView *dispalyView;
@property (nonatomic, weak) UILabel *displayLb;

@property (nonatomic, weak) UIView *inputView2;
@property (nonatomic) NSMutableArray *inputBtns;

//남은돈
@property (nonatomic, assign) NSInteger remaindMoney;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.itemData = @[@{@"title":@"sum1",@"cost":@"1000",@"imageName":@"island1"},
                      @{@"title":@"sum2",@"cost":@"2000",@"imageName":@"island2"},
                      @{@"title":@"sum3",@"cost":@"3000",@"imageName":@"island3.jpg"},
                      @{@"title":@"sum4",@"cost":@"4000",@"imageName":@"island4.jpg"}];
    
    self.costData = @[@"10000",@"5000",@"1000"];
    self.itemViews = [[NSMutableArray alloc] init];
    self.inputBtns = [[NSMutableArray alloc] init];
    
    [self createView];
    [self updateLayout];
}



- (void)createView
{
    //Display
    UIView *itemContainerView = [[UIView alloc] init];
    //    drinkContainerView.backgroundColor = [UIColor yellowColor];
    itemContainerView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:itemContainerView];
    self.itemContainerView = itemContainerView;
    

    //item View
    for (NSInteger i = 0; i < 4; i++) {
        //base
        ItemView *itemView = [[ItemView alloc] initWithData:self.itemData[i]];
        itemView.backgroundColor = [UIColor grayColor];
        itemView.tag = i;
        itemView.delegate = self;
        [self.itemContainerView addSubview:itemView];
        [self.itemViews addObject:itemView];

    }
    
    //Display View
    UIView *dispalyView = [[UIView alloc] init];
    dispalyView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:dispalyView];
    self.dispalyView = dispalyView;
    
    UILabel *displayLb = [[UILabel alloc] init];
    displayLb.text = @"0";
    displayLb.font = [UIFont systemFontOfSize:40];
    displayLb.textAlignment = NSTextAlignmentRight;
    [dispalyView addSubview:displayLb];
    self.displayLb = displayLb;
    
    
    //Input View
    UIView *inputView = [[UIView alloc] init];
    inputView.backgroundColor = [UIColor redColor];
    [self.view addSubview:inputView];
    self.inputView2 = inputView;

    

    for (NSInteger i = 0; i < [self.costData count]; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn addTarget:self action:@selector(onTouchupInsideCoin:) forControlEvents:UIControlEventTouchUpInside];
        btn.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|  UIViewAutoresizingFlexibleHeight;
        [btn setTitle:[self.costData objectAtIndex:i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        btn.tag = i;
        [inputView addSubview:btn];
        [self.inputBtns addObject:btn];
    }
    
    
}

//UI잡기
- (void)updateLayout
{
    //큰 틀 y좌표
    CGFloat baseViewOffsetY = 45;
    
    //드링크 뷰 하나의 높이는 200정도 잡느다.
    self.itemContainerView.frame = CGRectMake(20, baseViewOffsetY, self.view.frame.size.width - 40, 400+10);
    baseViewOffsetY += self.itemContainerView.frame.size.height + 30;
    
    //item Layout
    const NSInteger baseViewBet = 10;
    for (UIView *itemView in self.itemViews) {
        NSInteger row = itemView.tag/2;
        NSInteger cal = itemView.tag%2;
        CGFloat itemViewWidth = (self.itemContainerView.frame.size.width - 10)/2;
        CGFloat itemViewHeight = (self.itemContainerView.frame.size.height - 10)/2;
        itemView.frame = CGRectMake((itemViewWidth + baseViewBet)*cal,(itemViewHeight + baseViewBet)*row, itemViewWidth,itemViewHeight);
    }
    
    //displayView Layout
    self.dispalyView.frame = CGRectMake(20, baseViewOffsetY, self.view.frame.size.width - 40, 150);
    self.displayLb.frame = CGRectMake(0, 0, self.dispalyView.frame.size.width, self.dispalyView.frame.size.height);
    baseViewOffsetY += self.dispalyView.frame.size.height + 15;
    
    //inputView Layout
    self.inputView2.frame = CGRectMake(20, baseViewOffsetY, self.view.frame.size.width - 40, 45);
    NSInteger btnWitdh = self.inputView2.frame.size.width/[self.inputBtns count] - 10;
    for (UIView *inputBtn in self.inputBtns) {
        inputBtn.frame = CGRectMake((btnWitdh + 10)*inputBtn.tag, 0, btnWitdh, self.inputView2.frame.size.height);
    }
    
}

- (void)didSelectedItemView:(ItemView *)itemView
{
    //현재 클릭된 버튼의 금액

    NSString *title = [itemView getTitle];
    NSInteger cost = [itemView getCost];
    
    
    if (self.remaindMoney >= cost) {
        //디스플레이 업데이트
        self.remaindMoney -= cost;
        self.displayLb.text = [NSString stringWithFormat:@"%ld",_remaindMoney];
        
        UIAlertController *alertContoller = [UIAlertController alertControllerWithTitle:@"빙고"
                                                                                message:[NSString stringWithFormat:@"%@가 나왔습니다.",title]
                                                                         preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okBtn = [UIAlertAction actionWithTitle:@"확인"
                                                        style:UIAlertActionStyleCancel handler:nil];
        [alertContoller addAction:okBtn];
        [self presentViewController:alertContoller animated:YES completion:nil];
        
    }else
    {
        //잔액이 부족합니다.
        UIAlertController *alertContoller = [UIAlertController alertControllerWithTitle:@"실패"
                                                                                message:@"잔액이 부족합니다."
                                                                         preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okBtn = [UIAlertAction actionWithTitle:@"확인"
                                                        style:UIAlertActionStyleCancel handler:nil];
        [alertContoller addAction:okBtn];
        [self presentViewController:alertContoller animated:YES completion:nil];
    }
}

- (void)onTouchupInsideCoin:(UIButton *)sender
{
    
    //현재 클릭된 버튼의 가격
    NSInteger selectedTag = sender.tag;
    NSString *costStr =  [self.costData objectAtIndex:selectedTag];
    
    //디스플레이 뷰에 넣기
    self.remaindMoney += costStr.integerValue;
    self.displayLb.text = [NSString stringWithFormat:@"%ld",_remaindMoney];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
