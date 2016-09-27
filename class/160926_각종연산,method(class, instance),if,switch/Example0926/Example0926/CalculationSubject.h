//
//  CalculationSubject.h
//  Example0926
//
//  Created by david on 2016. 9. 26..
//  Copyright © 2016년 david. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * 학점 계산기 클래스, 월의 마지막 날, 윤년 체크
 * @author 이홍화
 * @version 0.1
 */
@interface CalculationSubject : NSObject

///총점
@property NSInteger totalScore;
///과목수
@property NSInteger subjectCount;

//NSInteger이게 프리미티브 타입이 아니다 그런데 *는 왜 안쓸까 ??

/**
 * override
 * totalScore, subjectCount 0값으로 초기화
 * @author 이홍화
 * @version 0.1
 */
- (instancetype)init;

/**
 * 점수 더하기, 과목 수 구하기
 * @author 이홍화
 * @version 0.1
 * @param score 더할 점수
 */
- (void)addScore:(NSInteger)score;

/**
 * 평균 더하기
 * @author 이홍화
 * @version 0.1
 */
- (CGFloat)average;

/**
 * 점수를 등급으로 변환
 * @author 이홍화
 * @version 0.1
 * @param score 점수
 */
+ (NSString *)convertGrade:(NSInteger)score;

/**
 * 등급을 장학금으로 변환
 * @author 이홍화
 * @version 0.1
 * @param grade 등급
 */
- (void)scholarshipWithGrade:(NSInteger)grade;

/**
 * 월의 마지막 날 구하기
 * @author 이홍화
 * @version 0.1
 * @param month 월
 */
+ (void)lastDayOfMonth:(NSInteger)month;

/**
 * 절대값 구하기
 * @author 이홍화
 * @version 0.1
 * @param num 정수
 */
- (NSInteger)absoluteNum:(NSInteger)num;

/**
 * 소수 셋째자리에서 반올림 하기
 * @author 이홍화
 * @version 0.1
 * @param num 실수
 */
+ (CGFloat)roundNum:(CGFloat)num;

/**
 * 윤년 구하기
 * @author 이홍화
 * @version 0.1
 * @param year 년도
 */
+ (void)checkLeapYear:(NSInteger)year;
@end
