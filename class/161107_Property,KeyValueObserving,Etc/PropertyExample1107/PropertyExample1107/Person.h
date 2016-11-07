//
//  Person.h
//  PropertyExample1107
//
//  Created by david on 2016. 11. 7..
//  Copyright © 2016년 david. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Person : NSObject
{
    //인스턴스 변수 : 외부에서 접근할수 없다.
    //내부 변수라는 의미 (관용적인 의미) 안에서만 쓰는 변수다
    NSString *_personName;
    NSInteger _age;
    CGFloat _weight;
}

/** 
 이름 출력(get을 안쓰는 거다)
 */
- (NSString *)personName;

/**
 나이 출력
 */
- (NSInteger)age;

/**
 몸무게 출력
 */
- (CGFloat)weight;

/**
 이름 저장
 */
- (void)setPersonName:(NSString *)personName;

/**
 나이 저장
 */
- (void)setAge:(NSInteger)age;

/**
 몸무게 저장
 */
- (void)setWeight:(CGFloat)weight;

/**
 사람정보 출력
 */
- (void)prinfPersonInfo;

@end
