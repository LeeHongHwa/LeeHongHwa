//
//  CarCell.h
//  ExampleCustomTableView_1014
//
//  Created by david on 2016. 10. 14..
//  Copyright © 2016년 david. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 커스텀 셀(carImgView, coverView, carNameLb)
 */
@interface CarCell : UITableViewCell

/**
 이미지 셋
 @param name 이미지 이름
 */
- (void)setCarImgImgedName:(NSString *)name;

/**
 자동차 이름 셋
 @param name 자동차 이름
 */
- (void)setCarName:(NSString *)name;

@end
