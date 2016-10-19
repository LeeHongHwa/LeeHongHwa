//
//  ViewController.m
//  ExampleCustomTableView_1014
//
//  Created by david on 2016. 10. 14..
//  Copyright © 2016년 david. All rights reserved.
//

#import "ViewController.h"
#import "CarCell.h"

//UITableView를 사용하기 위해 Delegate와 DataSource를 사용한다
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

///자동차 테이블 뷰
@property UITableView *carTabelView;
///자동차 Data
@property NSArray *carInfo;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //자동차 정보 입력
    self.carInfo = @[@{@"title":@"BMW",
                       @"imgName":@"bmw.jpg"},
                     
                     @{@"title":@"FORD",
                       @"imgName":@"ford.jpg"},
                     
                     @{@"title":@"HONDA",
                       @"imgName":@"honda.jpg"},
                     
                     @{@"title":@"JAGUAR",
                       @"imgName":@"jaguar.jpg"},
                     
                     @{@"title":@"LAMBO",
                       @"imgName":@"lambo.jpg"},
                     
                     @{@"title":@"TESLA",
                       @"imgName":@"tesla.jpg"}];
 
    //테이블뷰 생성
    self.carTabelView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.carTabelView.delegate = self;
    self.carTabelView.dataSource = self;
    [self.view addSubview:self.carTabelView];
    
}

//테이블뷰 로우값 지정
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{  
    return self.carInfo.count;
}

//테이블뷰 셀값 지정
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CarCell *cell = [tableView dequeueReusableCellWithIdentifier:@"carName"];
    
    if (cell == nil)
    {
        cell = [[CarCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"caraName"];
    }
//    NSMutableDictionary *tempCarInfo = self.carName[indexPath.section];
    
    NSDictionary *tempCarInfo = self.carInfo[indexPath.row];

//    NSArray *tempCarTitle = [tempCarInfo objectForKey:@"title"];
//    
//    NSArray *tempCarImgName = [tempCarInfo objectForKey:@"imgName"];
  
    [cell setCarImgImgedName:[tempCarInfo objectForKey:@"imgName"]];
    [cell setCarName:[tempCarInfo objectForKey:@"title"]];
    return cell;
}
//테이블뷰 높이지정
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
