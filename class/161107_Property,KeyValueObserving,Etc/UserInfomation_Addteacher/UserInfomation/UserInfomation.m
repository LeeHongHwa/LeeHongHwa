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

//  강사님 코드 : getter method override : _lastName + _firstName
//- (NSString *)fullName {
//    return [NSString stringWithFormat:@"%@ %@", _lastName, _firstName];
//}
//  강사님 코드 : getter method override : notificationCenter post
//- (void)setHobby:(NSString *)hobby {
//    _hobby = hobby;
//    
//    [[NSNotificationCenter defaultCenter] postNotificationName:DidChangeHobbyValueNotification object:self];
//}

@end
