//
//  Person.h
//  Example0923
//
//  Created by david on 2016. 9. 23..
//  Copyright © 2016년 david. All rights reserved.
//

//import의 의미는?
#import <Foundation/Foundation.h>

/**
 * 사람 클래스
 * NSObject를 상속 받았다.
 * 이름, 나이, 전화번호, 도시, 성별, 잘생김의 속성값이 있다.
 * @author 이홍화
 * @verison 0.1
 */
@interface Person : NSObject

///사람의 이름
@property NSString *name;

///사람의 나이
@property NSInteger age;

///핸드폰 전화번호
@property NSString *mobileNumber;

///사는 곳
@property NSString *city;

///성별
@property NSString *sex;

///잘생겼는가
@property BOOL isHandsome;

/**
 * 이름과 잘생김의 속성값을 부여하는 초기화 메서드
 * @author 이홍화
 * @version 0.1
 * @param name 이름
 * @param isHandsome 잘생김의 여부
 */
- (instancetype)initWithName:(NSString *)name isHandsome:(BOOL)isHandsome;

/**
 * 이름, 거주지 속성값을 부여하는 초기화 메서드
 * @author 이홍화
 * @version 0.1
 * @param name 이름
 * @param city 거주지
 */
- (instancetype)initWithName:(NSString *)name city:(NSString *)city;

/**
 * 나이, 거주지, 성별 속성값을 부여하는 초기화 메서드
 * @author 이홍화
 * @version 0.1
 * @param age 나이
 * @param city 거주지
 * @param sex 성별
 */
- (instancetype)initWithAge:(NSInteger)age city:(NSString *)city sex:(NSString *)sex;

- (id)call;
@end
