//
//  UserInfomation.h
//  UserInfomation
//
//  Created by david on 2016. 11. 7..
//  Copyright © 2016년 david. All rights reserved.
//

#import <Foundation/Foundation.h>

//static NSNotificationName const DidChangeHobbyValueNotification = @"DidChangedHobby";

@interface UserInfomation : NSObject

///아이디
@property NSString *userID;
///비밀번호
@property NSString *userPW;
///성
@property NSString *userLastName;
///이름
@property NSString *userFirstName;
///나이
@property NSString *userAge;
///취미
@property NSString *userHobby;

/**
 싱글턴 객체 생성
 */
+ (instancetype)sharedManager;

@end
