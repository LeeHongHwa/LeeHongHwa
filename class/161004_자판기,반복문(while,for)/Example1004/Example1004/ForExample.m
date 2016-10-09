//
//  ForExample.m
//  Example1004
//
//  Created by david on 2016. 10. 4..
//  Copyright © 2016년 david. All rights reserved.
//

#import "ForExample.h"

@implementation ForExample

//구구단
+ (void)getMultiplication:(NSInteger)number
{

/*
 while 문
 
    NSInteger i = 1;
 
    while (i < 10) 
    {
        NSInteger result = number * i;
        NSLog(@"%ld * %ld =  %ld",number, i, result);
        i += 1;
    }
*/
    
//for 문
    
    //number * 1~9 까지
    for (NSInteger i = 1; i < 10; i += 1)
    {
        NSInteger result = number * i;
        NSLog(@"%ld * %ld = %ld",number, i, result);
    }
}

//팩토리얼
+ (void)factorial:(NSInteger)number
{
    NSInteger result = 1;
    
    //number의 숫자만큼 반복해서 곱하기
    for (NSInteger i = 1; i < number; i += 1 )
    {
        result *= i;
        NSLog(@"%ld %ld",result, i);
    }
    NSLog(@"%ld",result);
}

//삼각수
+ (void)triangularNum:(NSInteger)number
{
    NSInteger result = 0;
    
    //number의 숫자만큼 반복해서 더하기
    for (NSInteger i = 0; i < number+1; i += 1)
    {
        result += i;
    }
    
    NSLog(@"%ld의 삼각수는 %ld 입니다.",number , result);
}

//각 자리수 더하는 메서드
+ (void)addAllNum:(NSInteger)number
{
    //반복, 결과, 각자리수 변수 초기화
    NSInteger i = 0, result = 0, remainder = 0;
    
    while (i < number)
    {
        //자리수 구하기
        remainder = number % 10;
        //자리수 더하기
        result += remainder;
        //다음 자리수를 구하기 위한 나누기
        number /= 10;
    }
    NSLog(@"addAllNum %ld",result);
}

//3,6,9 (unLimited)
+ (id)game369:(NSInteger)number
{   //number의 숫자만큼 반복
    for (NSInteger i = 0; i < number; i += 1)
    {   //1부터 시작
        NSInteger num = i + 1;
        //num이 0보다 작거나 같을때 까지 될때까지 반복
        while (0 < num)
        {   //각자리를 구하기 위해 나머지를 구한다
            NSInteger checkNum = num % 10;
            //나머지가 3, 6, 9라면 *를 출력하고 num = 0을 선언해 while을 빠져나간다
            if (checkNum == 3 || checkNum == 6 || checkNum == 9)
            {
            NSLog(@"*");
                num = 0;
            //num이 10보다 작다면
            }else if (num < 10)
            {
                NSLog(@"%ld",i + 1);
                num = 0;
            //num이 10보다 크다면 각자리수를 구해주기위해 10을 나눈다
            }else
            {
                num = num / 10;
            }
        }
    }
    return nil;
}

/*
 3,6,9(max29)
 
+ (void)game369:(NSInteger)number 
 {
    for (NSInteger i = 0; i < number; i += 1) 
    {
        NSInteger num = i + 1;
        if (num % 10 == 3 || num % 10 == 6 || num % 10 == 9) 
        {
            NSLog(@"*");
        }else 
        {
            NSLog(@"%ld",num);
        }
    }
}
*/



@end
