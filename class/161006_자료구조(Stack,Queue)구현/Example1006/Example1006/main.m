//
//  main.m
//  Example1006
//
//  Created by david on 2016. 10. 6..
//  Copyright © 2016년 david. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Stack.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //stack 객체 생성
        Stack *stack = [[Stack alloc] init];
        
        //stack의 Empty 여부
        NSLog(@"%hhd",[stack isEmpty]);
        
        //stack에 값을 넣는다
        [stack push:@"1"];
        [stack push:@"2"];
        [stack push:@"3"];
        
        //stack값 출력
        NSLog(@"%@",[stack pop]);
        NSLog(@"%@",[stack pop]);
        NSLog(@"%@",[stack pop]);
        
        //stack응용 괄호검사
        [stack checkBracketString:@"([])"];

    }
    return 0;
}
