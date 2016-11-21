//
//  ViewController.m
//  UITableViewPractice
//
//  Created by david on 2016. 11. 21..
//  Copyright © 2016년 david. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

///cell data
@property NSMutableArray *cellNum;

///tableHeaderView의 imageView
@property UIImageView *imageView;

///tableView
@property UITableView *testTableView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //create view
    //tableview에 setting할 경우 height값만 적용된다.
    UIView *greenView = [[UIView alloc] initWithFrame:CGRectMake(50, 100, 48, 100)];
    greenView.backgroundColor = [UIColor greenColor];
    
    //create imageView
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"forest.jpg"]];
    self.imageView.frame = CGRectMake(0, 0, 10, 200);
    
    //create tableView(programmatically)
    self.testTableView = [[UITableView alloc] initWithFrame:CGRectMake(0,
                                                                       0,
                                                                       self.view.frame.size.width,
                                                                       self.view.frame.size.height) style:UITableViewStyleGrouped];
    self.testTableView.delegate = self;
    self.testTableView.dataSource = self;
    self.testTableView.tableHeaderView = self.imageView;
    [self.view addSubview:self.testTableView];
    
    //cell data
    self.cellNum = [NSMutableArray array];
    [self.cellNum addObject:@"1"];
    
    //create barButtonItem
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                   target:self  //[target action]
                                                                                   action:@selector(addTestCellObject:)];
    //setting barButtonItem
    self.navigationItem.leftBarButtonItem = barButtonItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                           target:self
                                                                                           action:@selector(changeImage:)];
}

/**
 *  tableHeaderView 이미지 변경
 */
- (void)changeImage:(id)sender
{
    self.imageView.image = [UIImage imageNamed:@"sea.jpg"];
}

/**
 *  cell data 추가
 */
- (void)addTestCellObject:(id)sender
{
    
    [self.cellNum addObject:[NSDateFormatter localizedStringFromDate:[NSDate date]
                                                           dateStyle:NSDateFormatterShortStyle
                                                           timeStyle:NSDateFormatterShortStyle]];
    
    [self.testTableView reloadData];
}

/**
 *  tableView section값 setting
 */
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

/**
 *  tableView row값 setting
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
            return self.cellNum.count;
            break;
            
        case 1:
            return 10;
            break;
            
        default:
            return 0;
            break;
    }
}

/**
 *  tableView cell setting(programmatically)
 *  indexPath값이 변경될때 계속해서 call이 될것이기 때문에 이안에서 alloc을 하는 행위는 메모리를 부족하게 할 수있다.
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"cell"];
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    
    switch (indexPath.section) {
        case 0:
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",[self.cellNum objectAtIndex:indexPath.row]];
            break;
        case 1:
            cell.detailTextLabel.text = @"섹션2";
            break;
    }
    return cell;
}

/**
 *  indexTitle setting
 */
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return @[@"ㄱ",@"ㄴ"];
}

/**
 *  sectionHeaderTitle setting
 */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
            return @"1";
            break;
        case 1:
            return @"2";
            break;
        default:
            return nil;
            break;
    }
}

/**
 *  rowHeight setting
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

/**
 *  cell을 눌렀을때 다음 viewController로 이동
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.selected = NO;
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    //다음 viewController의 property 값 setting
    DetailViewController *detailVC = [storyboard instantiateViewControllerWithIdentifier:@"DetailVC"];
    [detailVC setDetailTextString:cell.detailTextLabel.text];
    
    //push
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
