//
//  ItemView.h
//  VendingMachine
//
//  Created by youngmin joo on 2016. 10. 11..
//  Copyright © 2016년 WingsCompany. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 itemView 커스텀뷰
 */

@protocol ItemViewDelegate;

@interface ItemView : UIView

@property (nonatomic, weak) id <ItemViewDelegate> delegate;

//override
- (instancetype)initWithData:(NSDictionary *)data;
//비용 저장
- (NSInteger)getCost;
//제목 저장
- (NSString *)getTitle;

@end

@protocol ItemViewDelegate <NSObject>

//delegate method
- (void)didSelectedItemView:(ItemView *)itemView;

@end

