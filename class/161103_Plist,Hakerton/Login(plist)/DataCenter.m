//
//  DataCenter.m
//  Login
//
//  Created by david on 2016. 11. 2..
//  Copyright © 2016년 david. All rights reserved.
//

#import "DataCenter.h"

@interface DataCenter()

@property NSMutableArray *UserData;
@property NSString *docuPath;

@end

@implementation DataCenter

//싱글턴 객체 생성
+ (instancetype)sharedInstance
{
    static DataCenter *instance = nil;
    static dispatch_once_t token;
    
    dispatch_once(&token, ^{
        instance = [[self alloc] initWithUserData];
    });
    return instance;
}

//init override
- (instancetype)initWithUserData
{
    self = [super init];
    if (self)
    {
        [self loadList];
    }
    return self;
}

//data load
- (void)loadList
{
    //파일 불러오기
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = [paths objectAtIndex:0];
    self.docuPath = [basePath stringByAppendingString:@"UserData.plist"];
    
    //Document folder에 파일 있는지 확인
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:self.docuPath])
    {
        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"UserData"
                                                               ofType:@"plist"];
        [fileManager copyItemAtPath:bundlePath
                             toPath:self.docuPath
                              error:nil];
    }
    //데이터 변경
    self.UserData = [NSMutableArray arrayWithContentsOfFile:self.docuPath];
}

//data save
- (void)saveList:(NSDictionary *)list
{
    [self.UserData addObject:list];
    //저장
    [self.UserData writeToFile:self.docuPath atomically:NO];
}

//아이디, 패스워드 저장
- (void)setUserID:(NSString *)ID userPW:(NSString *)PW
{
    NSMutableDictionary *tempDic = [NSMutableDictionary dictionaryWithObject:ID forKey:userID];
    [tempDic setObject:PW forKey:userPW];
    [self saveList:tempDic];
    [[NSUserDefaults standardUserDefaults] setObject:ID forKey:userID];
}

//아이디 출력
- (NSString *)getUserIDwithcurrentID:(NSString *)currentID
{
    for (NSDictionary *tempID in self.UserData)
    {
        NSString *savedID = [tempID objectForKey:userID];
        if ([savedID isEqualToString:currentID])
        {
            return savedID;
        }
    }
    return nil;
}

//패스워드 출력
- (NSString *)getUserPWwithcurrentID:(NSString *)currentID
{
    for (NSDictionary *tempID in self.UserData)
    {
        NSString *savedID = [tempID objectForKey:userID];
        if ([savedID isEqualToString:currentID])
        {
            return [tempID objectForKey:userPW];;
        }
    }
    return nil;
}

//자동 로그인시 아이디 나타냄
- (void)getUserID:(NSString *)ID
{
    [[NSUserDefaults standardUserDefaults] objectForKey:userID];
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

//현제 로그인 아이디 출력
- (NSString *)getUserID
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:userID];
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
