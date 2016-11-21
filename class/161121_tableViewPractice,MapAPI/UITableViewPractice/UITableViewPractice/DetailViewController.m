//
//  DetailViewController.m
//  UITableViewPractice
//
//  Created by david on 2016. 11. 21..
//  Copyright © 2016년 david. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

///text label
@property (weak, nonatomic) IBOutlet UILabel *cellDetailTextLabel;

///text label string
@property NSString *detailTextString;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //text label setting
    self.cellDetailTextLabel.text = _detailTextString;
}

/**
 *  setting string
 */
- (void)settingTextLabel:(NSString *)text;
{
    self.detailTextString = text;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
