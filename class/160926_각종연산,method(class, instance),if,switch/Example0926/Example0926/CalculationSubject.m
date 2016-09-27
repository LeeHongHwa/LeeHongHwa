//
//  CalculationSubject.m
//  Example0926
//
//  Created by david on 2016. 9. 26..
//  Copyright © 2016년 david. All rights reserved.
//

#import "CalculationSubject.h"

@implementation CalculationSubject

//초기화 함수 객체만들때 init하면 상관없지 않을까
//init override
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.totalScore = 0;
        self.subjectCount = 0;
    }
    return self;
}
//점수를 받아서 토탈변수에 더한다.
//더해진 정수마다 과목 카운트를 하나씩 올린다.
//subjectCount가 축적이 될까?

//점수 더하기, 과목 수 구하기
- (void)addScore:(NSInteger)score
{
    self.totalScore = self.totalScore + score;
    self.subjectCount = self.subjectCount + 1;
    NSLog(@"subjectCount : %ld",self.subjectCount);
}

//평균 구하기
- (CGFloat)average
{
    CGFloat averageTemp = 0;
    if (self.subjectCount != 0) {
        averageTemp = (CGFloat)self.totalScore/(CGFloat)self.subjectCount;
    } //캐스팅 자료형을 그줄에서만 바꿔줌
    return averageTemp; //return 0 에러방지 임시방편
}

//등급으로 바꾸기
+ (NSString *)convertGrade:(NSInteger)score
{
    NSString *grade;//지역변수
    
    if (95 < score && score <= 100) {
        grade = @"A+";
    } else if (90 < score && score <= 95) {
        grade = @"A";
    } else if (85 < score && score <= 90) {
        grade = @"B+";
    } else if (85 < score && score <= 90) {
        grade = @"B";
    } else if (80 < score && score <= 85) {
        grade = @"C+";
    } else if (75 < score && score <= 80) {
        grade = @"C";
    } else if (70 < score && score <= 75) {
        grade = @"D+";
    } else if (0 < score && score <= 70) {
        grade = @"D";
    } else {
        return 0;
    }
    return grade;
}

//등급을 장학금으로 바꾸기
- (void)scholarshipWithGrade:(NSInteger)grade
{
    switch (grade) {
        case 1:
            NSLog(@"전액 장학금");
            break;
        case 2:
            NSLog(@"50%% 장학금");
            break;
        case 3:
            NSLog(@"30%% 장학금");
            break;
        default:
            NSLog(@"장학금 없음");
            break;
    }
}

//달의 마지막날 구하기
+ (void)lastDayOfMonth:(NSInteger)month
{
    switch (month)
    {
        case 1:
        case 3:
        case 5:
        case 7:
        case 8:
        case 10:
        case 12:
            NSLog(@"31일");
            break;
        case 4:
        case 6:
        case 9:
        case 11:
            NSLog(@"30일");
            break;
        case 2:
            NSLog(@"29일");
            break;
        default:
            NSLog(@"1~12사이의 숫자를 입력해주세요");
            break;
    }
}

//절대값
- (NSInteger)absoluteNum:(NSInteger)num {
    if (num < 0) {
        return -1 * num;
    }
    return num;
}

//반올림
+ (CGFloat)roundNum:(CGFloat)num {
    
    NSInteger intRoundNum = ((num + 0.005) * 100);
    return (CGFloat)intRoundNum / 100;
    
}

//윤년
+ (void)checkLeapYear:(NSInteger)year {
    
    if ((year % 4 == 0 && year % 100 != 0) ||year % 400 == 0) {
        NSLog(@"%ld는 윤년입니다",year);
    } else {
        NSLog(@"%ld는 윤년이 아닙니다",year);
    }
}

@end
