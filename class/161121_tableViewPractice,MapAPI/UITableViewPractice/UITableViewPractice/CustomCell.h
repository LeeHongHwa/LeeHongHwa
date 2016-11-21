//
//  CustomCell.h
//  UITableViewPractice
//
//  Created by david on 2016. 11. 21..
//  Copyright © 2016년 david. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell
///cell imageView
@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;

///cell label
@property (weak, nonatomic) IBOutlet UILabel *cellLabel;
@end
