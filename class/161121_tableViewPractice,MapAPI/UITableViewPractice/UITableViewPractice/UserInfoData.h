//
//  UserInfoData.h
//  UITableViewPractice
//
//  Created by david on 2016. 11. 21..
//  Copyright © 2016년 david. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfoData : NSObject

///imageList
@property NSArray *userInfoArr;

//싱글턴 객체 생성
+ (instancetype)sharedUserInfoData;

@end
