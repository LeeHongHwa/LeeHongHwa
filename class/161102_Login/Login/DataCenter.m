//
//  DataCenter.m
//  Login
//
//  Created by david on 2016. 11. 2..
//  Copyright © 2016년 david. All rights reserved.
//

#import "DataCenter.h"

@interface DataCenter()

@property NSMutableArray *loginData;
@end

@implementation DataCenter

//싱글턴 객체 생성
+ (instancetype)sharedInstance
{
    static DataCenter *instance = nil;
    static dispatch_once_t token;
    
    dispatch_once(&token, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

//아이디, 패스워드 저장
- (void)setUserID:(NSString *)ID userPW:(NSString *)PW
{
    [[NSUserDefaults standardUserDefaults] setObject:ID forKey:userID];
    [[NSUserDefaults standardUserDefaults] setObject:PW forKey:userPW];
}

//아이디 출력
- (NSString *)getUserID
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:userID];
}

//패스워드 출력
- (NSString *)getUserPW
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:userPW];
}

//로그인 상태 저장
- (void)setLoginState:(BOOL)loginState
{
    NSNumber *loginStateNum = [NSNumber numberWithBool:loginState];
    [[NSUserDefaults standardUserDefaults] setObject:loginStateNum forKey:userLoginState];
}

//로그인 상태 출력
- (BOOL)getLoginState
{
    NSNumber *loginStateNum = [[NSUserDefaults standardUserDefaults] objectForKey:userLoginState];
    BOOL loginState = [loginStateNum boolValue];
    return loginState;
}


//로그인 기록 제거
- (void)removeLoginRecord
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:userLoginState];
}

//로그아웃 상태 저장
- (void)setLogoutStateWithIndex:(NSInteger)index
{
    NSNumber *logoutStateIndexTemp = [NSNumber numberWithInteger:index];
    [[NSUserDefaults standardUserDefaults] setObject:logoutStateIndexTemp forKey:userLogoutState];
}

//로그아웃 상태 출력
- (NSInteger)getLogoutState
{
    NSNumber *logoutStateIndexTemp = [[NSUserDefaults standardUserDefaults] objectForKey:userLogoutState];
    NSUInteger logoutStateIndex = [logoutStateIndexTemp integerValue];
    return logoutStateIndex;
}

@end
