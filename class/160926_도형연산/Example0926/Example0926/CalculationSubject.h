//
//  CalculationSubject.h
//  Example0926
//
//  Created by david on 2016. 9. 26..
//  Copyright © 2016년 david. All rights reserved.
//

/*
 1.학전 계산기 클래스 만들기
 2.property 만들기
 3.method 만들기
 - 과목 점수 더하는 함수
 - 평균 구하는 함수
 */

#import <Foundation/Foundation.h>

@interface CalculationSubject : NSObject

@property NSInteger totalScore;

@property NSInteger subjectCount;

//NSInteger이게 프리미티브 타입이 아니다 
- (void)addScore:(NSInteger)score;
- (CGFloat)average;



@end
