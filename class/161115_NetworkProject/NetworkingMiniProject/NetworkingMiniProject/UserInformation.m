//
//  UserInformation.m
//  NetworkingMiniProject
//
//  Created by david on 2016. 11. 15..
//  Copyright © 2016년 david. All rights reserved.
//

#import "UserInformation.h"

@implementation UserInformation

//싱글턴 메서드
+ (id)sharedUserInfo {
    static UserInformation *sharedUserInfo = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedUserInfo = [[self alloc] init];
    });
    return sharedUserInfo;
}

@end
