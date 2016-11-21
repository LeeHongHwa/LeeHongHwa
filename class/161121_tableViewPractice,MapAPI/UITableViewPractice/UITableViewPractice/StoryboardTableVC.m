//
//  StoryboardTableVC.m
//  UITableViewPractice
//
//  Created by david on 2016. 11. 21..
//  Copyright © 2016년 david. All rights reserved.
//

#import "StoryboardTableVC.h"
#import "CustomCell.h"

@interface StoryboardTableVC ()<UITableViewDelegate, UITableViewDataSource>

///tableView
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation StoryboardTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //이미지 데이터 요청
    [RequestNetwork requestImageList];
    
    //add observer
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didImageListDowloadReloadTableView)
                                                 name:imageListDownloadNotification
                                               object:nil];
}

/**
 *  이미지 리스트가 다운로드 완료시 불릴 메서드
 */
- (void)didImageListDowloadReloadTableView
{
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  tableView row setting
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[UserInfoData sharedUserInfoData] userInfoArr].count;
}

/**
 *  tableView cell setting(storyboard)
 *  이미 객체가 만들어진 상태라 nil확인을 안한다.
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"storyboardCell" forIndexPath:indexPath];
    
    //UserInfoData에서 데이터를 가져온다
    NSDictionary *tempDict = [[[UserInfoData sharedUserInfoData] userInfoArr] objectAtIndex:indexPath.row];
    
    cell.cellLabel.text = [tempDict objectForKey:@"title"];
    
    NSString *URLString = [tempDict objectForKey:@"thumbnail_url"];
    
    //create dataTaskHandler
    id dataTaskHandler = ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_sync(dispatch_get_main_queue(), ^{
            CustomCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            cell.cellImageView.image = [UIImage imageWithData:data];
        });
    };
    
    //thumbnailImage request
    NSURL *thumbnailURL = [NSURL URLWithString:URLString];
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithURL:thumbnailURL
                                                                 completionHandler:dataTaskHandler];
    [dataTask resume];
    
    return cell;
}

@end
