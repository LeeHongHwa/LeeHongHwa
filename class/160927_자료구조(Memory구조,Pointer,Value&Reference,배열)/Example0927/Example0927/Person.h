//
//  Person.h
//  Example0927
//
//  Created by david on 2016. 9. 27..
//  Copyright © 2016년 david. All rights reserved.
//

#import <Foundation/Foundation.h>

//왜 구조체는 interface밖에서 선언일까
//아마도 클래스는 속성과 행동을 정의해놓는 공간이니깐 따로 분리를 해놨을까??

/**
 * value형 높이, 무게 값을 가지는 구조체
 * @author 이홍화
 * @version 0.1
 **/
typedef struct character
{
    CGFloat height;
    CGFloat weight;
}character;

@interface Person : NSObject

///이름
@property NSString *name;
///나이
@property NSInteger age;
///높이,무게 구조체
@property character info;


/**
 * 파라미터(name) 값으로 초기화 해주는 메서드
 * @author 이홍화
 * @version 0.1
 * @param name 이름
 **/
- (instancetype)initWithName:(NSString *)name;

/**
 * 구조체에 높이와 무게 값을 입력하는 setter 메서드
 * @author 이홍화
 * @version 0.1
 * @param height 높이
 * @param weight 무게
 **/
- (void)setHeight:(CGFloat)height weight:(CGFloat)weight;

/**
 * 구조체의 높이와 무게 값을 출력하는 getter 메서드 
 * @author 이홍화
 * @version 0.1
 **/
- (character)personInfo;
@end
