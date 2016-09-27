//
//  IfExample.m
//  Example0926
//
//  Created by david on 2016. 9. 26..
//  Copyright © 2016년 david. All rights reserved.
//

#import "IfExample.h"

@implementation IfExample

//짝수 구분 방법 1: 더 안정적인 방법이다.
+ (BOOL)isEvenNumber:(NSInteger)number
{
    BOOL isEven = NO;
    
    if (number%2 == 0) {
        isEven = YES;
    } else {
        isEven = NO;
    }
    return isEven;
    //변수를 만들고 리턴을 변수로
}

//짝수 구분 방법 2
+ (BOOL)isEvenNumber2:(NSInteger)number
{
    if (number%2 == 0) //number%2 == 1 일경우 논리적으로는 맞으나 컴퓨터는 이도저도 아닐경우엔 어떻게 할지 모르기 떄문에 오류를 내뱉는다
    {
        return YES;
    } else {
        return NO;
    }
}

@end
