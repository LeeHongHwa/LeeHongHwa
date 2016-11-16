//
//  UserInformation.m
//  NetworkingMiniProjectTeacher
//
//  Created by david on 2016. 11. 16..
//  Copyright © 2016년 david. All rights reserved.
//

#import "UserInformation.h"

@implementation UserInformation

+ (instancetype)sharedUserInfo {
    static UserInformation *sharedUserInfo = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedUserInfo = [[self alloc] init];
    });
    return sharedUserInfo;
}
@end
