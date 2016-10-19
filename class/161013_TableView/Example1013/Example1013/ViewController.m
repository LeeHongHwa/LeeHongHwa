//
//  ViewController.m
//  Example1013
//
//  Created by david on 2016. 10. 13..
//  Copyright © 2016년 david. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
///자동차이름
@property NSArray *carName;
///동물이름
@property NSArray *animalaName;
///이미지파일명
@property NSArray *img;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //자동차 이름
    self.carName = @[@"티코", @"람보", @"미니쿠퍼", @"멕나렌", @"스텔라", @"포티", @"부가티", @"벨로스터", @"시발차", @"두돈반"];
    
    //동물이름
    self.animalaName = @[
                         @{@"animal" : @"사자",
                           @"sort" : @[@"남자사자", @"여자사자"],
                           @"img" : @[@"camel.jpg", @"bear.jpg"],
                           @"footer" : @"어흥!"},
                         
                         @{@"animal" : @"곰",
                           @"sort" : @[@"남자곰", @"여자곰"],
                           @"img" : @[@"buffalo.jpg", @"donkey.jpg"],
                           @"footer" : @"으헝헝!"},
                         
                         @{@"animal" : @"기린",
                           @"sort" : @[@"남자기린", @"여자기린"],
                           @"img" : @[@"duck.jpg", @"manatus.jpg"],
                           @"footer" : @"기이이린!"}
                         ];


//------------------------------------------- 테이블뷰 연습 3 -----------------------------------------
    //UITableView 생성
    UITableView *animalAddImgTV = [[UITableView alloc] initWithFrame:CGRectMake(0, 60, self.view.frame.size.width , self.view.frame.size.height) style:UITableViewStylePlain];
    animalAddImgTV.delegate = self;
    animalAddImgTV.dataSource = self;
    [self.view addSubview:animalAddImgTV];
    
    
//-------------------------------------------- 테이블뷰 연습 2 -----------------------------------------
//    UITableView *animalTableView = [[UITableView alloc] initWithFrame:CGRectMake(0,
//                                                                           0,
//                                                                           self.view.frame.size.width,
//                                                                           self.view.frame.size.height)
//                                                          style:UITableViewStylePlain];
//    
//    animalTableView.delegate = self;
//    animalTableView.dataSource = self;
//    [self.view addSubview:animalTableView];
    
//------------------------------------------- 테이블뷰 연습 1 -----------------------------------------
//    UITableView *animalTableView = [[UITableView alloc] init];
//    animalTableView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
//    animalTableView.style = UITableViewStylePlain;
    
//    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,
//                                                                           0,
//                                                                           self.view.frame.size.width,
//                                                                           self.view.frame.size.height)
//                                                          style:UITableViewStylePlain];
//    
//    tableView.delegate = self;
//    tableView.dataSource = self;
//    [self.view addSubview:tableView];
    
}
//-------------------------------------------- 테이블뷰 연습 1 -----------------------------------------
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return self.carName.count;
//}
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    //스크롤 할때마다 계속 alloc init을 한다 메모리의 비효율성
//    //그래서 하는게 큐에서 재사용 가능한 셀을 빼라 아이덴티파이어를 가지고
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
//    
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
//    }
//    cell.textLabel.text = self.carName[indexPath.row];
//    
//    return cell;
//}
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 60;
//}

//-------------------------------------------- 테이블뷰 연습 2 -----------------------------------------
//색션 숫자
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return self.animalaName.count;
//}
//
//색션의 갯수만큼 반복
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    self.animalaName[section];
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"animal"];
//    
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"animal"];
//    }
//    
//    cell.textLabel.text = @"가";
//    
//    return cell;
//}

//-------------------------------------------- 테이블뷰 연습 3 -----------------------------------------
//섹션값 설정
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.animalaName.count;
}
//로우값 설정
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSMutableDictionary *tempDic = self.animalaName[section];
    NSMutableArray *temArr = [tempDic objectForKey:@"sort"];
    
    return temArr.count;
}
//셀값 설정
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"animal"];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"animal"];
    }
    
    NSMutableDictionary *tempDic = self.animalaName[indexPath.section];
    
    NSMutableArray *temArr = [tempDic objectForKey:@"sort"];
    
    NSMutableArray *temArrImg = [tempDic objectForKey:@"img"];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(test:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"new" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blueColor];
    button.frame = CGRectMake(0, 0, cell.frame.size.height, cell.frame.size.height);
    cell.accessoryView = button;
    cell.detailTextLabel.text = @"디테일 텍스트";
    cell.imageView.image = [UIImage imageNamed:temArrImg[indexPath.row]];
    cell.textLabel.text = temArr[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:16];
    return cell;
}
//테이블뷰의 헤더값 설정
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSMutableDictionary *tempDic = self.animalaName[section];
    NSString *tableHeader = [tempDic objectForKey:@"animal"];
    
    return tableHeader;
}
//테이블뷰의 select값 설정
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}
//테이블뷰의 footer값 설정
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    NSMutableDictionary *tempDic = self.animalaName[section];
    NSString *tableFooter = [tempDic objectForKey:@"footer"];
    
    return tableFooter;
}

//uibutton 메서드
- (void)test:(UIButton *)sender
{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
