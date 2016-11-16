//
//  UserInformation.h
//  NetworkingMiniProjectTeacher
//
//  Created by david on 2016. 11. 16..
//  Copyright © 2016년 david. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInformation : NSObject

@property NSString *userId;
@property NSArray *imageInfoList;

+ (instancetype)sharedUserInfo;

@end
