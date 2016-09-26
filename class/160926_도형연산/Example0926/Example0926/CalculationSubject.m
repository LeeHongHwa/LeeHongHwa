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
- (void)addScore:(NSInteger)score {
    
    self.totalScore = self.totalScore + score;
    self.subjectCount = self.subjectCount + 1;
    
}

//평균을 구해서 반환 해준다.
- (CGFloat)average {
    
    CGFloat averageTemp = (CGFloat)self.totalScore/(CGFloat)self.subjectCount;
    //캐스팅 자료형을 그줄에서만 바꿔줌
    return averageTemp;//return 0에러방지 임시방편
    
}

@end
