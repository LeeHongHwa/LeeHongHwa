//
//  ImageCell.h
//  NetworkingMiniProject
//
//  Created by david on 2016. 11. 15..
//  Copyright © 2016년 david. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageCell : UITableViewCell

//cellImageView
@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;

//cellTitle
@property (weak, nonatomic) IBOutlet UILabel *cellTitle;

@end
