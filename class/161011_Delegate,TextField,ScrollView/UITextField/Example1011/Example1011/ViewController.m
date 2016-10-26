//
//  ViewController.m
//  Example1011
//
//  Created by david on 2016. 10. 11..
//  Copyright © 2016년 david. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate,UITextFieldDelegate>
///텍스트 필드에 입력한 결과값
@property UILabel *resultText;
///텍스트 입력창
@property UITextField *inputText;
///페이지 라벨
@property UILabel *pageLabel;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

//    //텍스트 필드 객체 생성
//    self.inputText = [[UITextField alloc] init];
//    self.inputText.frame = CGRectMake(20, 20, 200, 50);
//    self.inputText.placeholder = @"텍스트 입력";
//    self.inputText.font = [UIFont systemFontOfSize:15];
//    self.inputText.textAlignment = NSTextAlignmentCenter;
//    self.inputText.borderStyle = UITextBorderStyleLine;
//    
//    [self.view addSubview:self.inputText];
//    
//    //UIButton객체 생성
//    UIButton *confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    confirmBtn.frame = CGRectMake(216, self.inputText.frame.origin.y, 50, 50);
//    
//    [confirmBtn setTitle:@"확인" forState:UIControlStateNormal];
//    
//    [confirmBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
//    
//    [confirmBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
//    
//    [confirmBtn setTitleColor:[UIColor greenColor] forState:UIControlStateSelected];
//    
//    [confirmBtn addTarget:self action:@selector(diplayText:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:confirmBtn];
//    
//    //결과창 객체 생성
//    self.resultText = [[UILabel alloc] init];
//    self.resultText.text = @"결과: 텍스트를 입력해주세요";
//    self.resultText.frame = CGRectMake(0, self.inputText.frame.size.height+16, self.inputText.frame.size.width, self.inputText.frame.size.height);
//    [self.inputText addSubview:self.resultText];
//}
    
    
//------------------------------------------------- scrollView 연습 -----------------------------------------------
//스크롤뷰 최초 생성시 맨아래 부분에 있어야 스크롤이 가능하다
//스크롤뷰 위에 addSubView를 해줘야 한다

//    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,
//                                                                              0,
//                                                                              self.view.frame.size.width,
//                                                                              self.view.frame.size.height)];
//    
//    [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width * 3, self.scrollView.frame.size.height)];
//
//    self.scrollView.delegate = self;
//    self.scrollView.pagingEnabled = YES;
//    [self.view addSubview:self.scrollView];
//    
//    UIView *newView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0,
//                                                                     0,
//                                                                     self.scrollView.frame.size.width,
//                                                                     self.scrollView.frame.size.height)];
//    newView1.backgroundColor = [UIColor blueColor];
//    [self.scrollView addSubview:newView1];
//    
//    UIView *newView2 = [[UIImageView alloc] initWithFrame:CGRectMake(
//                                                                     self.scrollView.frame.size.width,
//                                                                     0,
//                                                                     self.scrollView.frame.size.width,
//                                                                     self.scrollView.frame.size.height)];
//    newView2.backgroundColor = [UIColor greenColor];
//    [self.scrollView addSubview:newView2];
//    
//    UIView *newView3 = [[UIImageView alloc] initWithFrame:CGRectMake(self.scrollView.frame.size.width * 2,
//                                                                     0,
//                                                                     self.scrollView.frame.size.width,
//                                                                     self.scrollView.frame.size.height)];
//    newView3.backgroundColor = [UIColor redColor];
//    [self.scrollView addSubview:newView3];
//    
//    self.pageLabel = [[UILabel alloc] init];
//    self.pageLabel.text = @"page 1";
//    self.pageLabel.frame = CGRectMake(20, 20, self.view.frame.size.width, 50);
//    self.pageLabel.font = [UIFont systemFontOfSize:30];
//    self.pageLabel.textColor = [UIColor whiteColor];
//    [self.view addSubview:self.pageLabel];
//    
//}

//스크롤시 x 좌표를 읽어서 페이지에 맞는 라벨텍스트를 지정함
//contentOffset.x는 스크롤좌표를 읽어온다
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    if (self.scrollView.contentOffset.x < self.scrollView.frame.size.width) {
//        self.pageLabel.text = @"page 1";
//    }else if (self.scrollView.contentOffset.x < self.scrollView.frame.size.width * 2) {
//        self.pageLabel.text = @"page 2";
//    }else {
//        self.pageLabel.text = @"page 3";
//    }
}
//버튼을 누르면 텍스트에 입력한 정보를 라벨에 출력함
- (void)diplayText:(UIButton *)sender
{
    if (sender.selected)
    {
        sender.selected = NO;
        self.resultText.text = @"결과: 텍스트를 입력해주세요";
    } else
    {
        sender.selected = YES;
        self.resultText.text = [@"결과: " stringByAppendingString:self.inputText.text];
    }
}

//리턴을 눌렀을때 resign을 잘않쓰고 remove한다
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    return [textField resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
