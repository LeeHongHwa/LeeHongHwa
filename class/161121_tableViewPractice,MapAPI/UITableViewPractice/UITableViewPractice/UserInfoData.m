//
//  UserInfoData.m
//  UITableViewPractice
//
//  Created by david on 2016. 11. 21..
//  Copyright © 2016년 david. All rights reserved.
//

#import "UserInfoData.h"

@implementation UserInfoData

+ (instancetype)sharedUserInfoData
{
    static UserInfoData *sharedUserInfoData = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedUserInfoData = [[self alloc] init];
    });
    return sharedUserInfoData;
}


@end
