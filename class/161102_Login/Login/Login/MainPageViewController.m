//
//  MainPageViewController.m
//  Login
//
//  Created by david on 2016. 11. 2..
//  Copyright © 2016년 david. All rights reserved.
//

#import "MainPageViewController.h"

@interface MainPageViewController ()<UITableViewDelegate, UITableViewDataSource>
///아이디 라벨
@property (weak, nonatomic) IBOutlet UILabel *IDLabel;
///태이블 뷰
@property (weak, nonatomic) IBOutlet UITableView *tableView;
///로그아웃 상태
@property (weak, nonatomic) IBOutlet UISegmentedControl *logoutStateSegment;
///셀 데이터
@property NSArray *cellCountData;
@end

@implementation MainPageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //아이디 표시
    NSMutableString *mutableID = [NSMutableString stringWithString:self.IDLabel.text];
    [mutableID appendString:[[DataCenter sharedInstance] getUserID]];
    self.IDLabel.text = mutableID;
    
    //셀의 갯수
    self.cellCountData = [[NSArray alloc] init];
    
    //옵저버 등록
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(synchronizeLoginState:)
                                                 name:DidreceiveChangeLogoutState
                                               object:nil];
}

//셀 추가
- (IBAction)addCell:(UIBarButtonItem *)sender
{
    NSMutableArray *cellCountDataTemp = [[NSMutableArray alloc] init];
    [cellCountDataTemp addObjectsFromArray:self.cellCountData];
    [cellCountDataTemp addObject:@"1"];
    self.cellCountData = [cellCountDataTemp copy];
    [self.tableView reloadData];
}

//옵저버 메서드(로그아웃 상태 출력)
- (void)synchronizeLoginState:(NSNotification *)noti
{
    NSNumber *selectedIndexTemp = [[noti userInfo] objectForKey:userLogoutState];
    NSInteger selectedIndex = [selectedIndexTemp integerValue];
    [self.logoutStateSegment setSelectedSegmentIndex:selectedIndex];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark -- UITableViewDataSource
//tableView row
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cellCountData.count;
}

//tableView cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

#pragma mark -- UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //푸시
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *logoutViewController = [storyboard instantiateViewControllerWithIdentifier:@"logout"];
    [self.navigationController pushViewController:logoutViewController animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //로그아웃 상태 저장
    [[DataCenter sharedInstance] setLogoutStateWithIndex:[self.logoutStateSegment selectedSegmentIndex]];
    
}
@end
