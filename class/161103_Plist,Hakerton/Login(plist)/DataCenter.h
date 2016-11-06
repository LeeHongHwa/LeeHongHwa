//
//  DataCenter.h
//  Login
//
//  Created by david on 2016. 11. 2..
//  Copyright © 2016년 david. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataCenter : NSObject

//싱글턴 객체
+ (instancetype)sharedInstance;

//아이디와 비밀번호 저장
- (void)setUserID:(NSString *)ID userPW:(NSString *)PW;

//아이디 출력
- (NSString *)getUserIDwithcurrentID:(NSString *)currentID;

//패스워드 출력
- (NSString *)getUserPWwithcurrentID:(NSString *)currentID;

//로그인상태 저장
- (void)setLoginState:(BOOL)loginState;

//자동 로그인시 아이디 나타냄
- (NSString *)getUserID;

//로그인상태 출력
- (BOOL)getLoginState;

//로그인 기록 삭제
- (void)removeLoginRecord;

//로그아웃 싱태 출력(세그먼트)
- (NSInteger)getLogoutState;

//로그아웃 상태 저장(세그먼트)
- (void)setLogoutStateWithIndex:(NSInteger)index;
@end
