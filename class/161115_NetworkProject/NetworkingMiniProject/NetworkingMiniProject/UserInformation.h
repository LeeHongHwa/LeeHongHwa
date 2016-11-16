//
//  UserInformation.h
//  NetworkingMiniProject
//
//  Created by david on 2016. 11. 15..
//  Copyright © 2016년 david. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInformation : NSObject

///사용자 아이디
@property NSString *userId;
@property NSArray *imageInfoList;

//싱글턴 메서드
+ (instancetype)sharedUserInfo;

@end
