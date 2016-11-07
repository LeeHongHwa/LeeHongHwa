//
//  UserInfomation.m
//  UserInfomation
//
//  Created by david on 2016. 11. 7..
//  Copyright © 2016년 david. All rights reserved.
//

#import "UserInfomation.h"

@implementation UserInfomation

+ (instancetype)sharedManager {
    static UserInfomation *sharedMyManager = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

//저장

//불러오기
@end
