//
//  Stack.m
//  Example1006
//
//  Created by david on 2016. 10. 6..
//  Copyright © 2016년 david. All rights reserved.
//

#import "Stack.h"

@implementation Stack

//초기화 하나의 헤더 생성
- (instancetype)init
{
    /*  
        self = [super init]; 이걸 왜할까?
        override를 통해 NSObject가 구현한 init을 사용하지 못하니 미리 super에서 사용하고 아래에 재정의를 하는것이다
    */
    self = [super init];
    
    if (self)
    {
        
        self.header = [[Node alloc] init];
        self.header.next = nil;
        
    }
    return self;
}

//마지막에 값 추가
- (void)push:(NSString *)value
{
    [self addNewNode:self.header WithValue:value];
}

- (void)addNewNode:(Node *)nowNode WithValue:(NSString *)value
{
    //새로운 노드 생성
    Node *newNode = [[Node alloc] init];
    //값 추가
    newNode.value = value;
    //Node의 끝을 찾아 추가
    while (nowNode.next != nil)
    {
        nowNode = nowNode.next;
    }
    nowNode.next = newNode;
    newNode.next = nil;
}

/*
    *****나의 실수*****
 
    위와 똑같은 것이지만 매개변수 부분에 .next까지 포함을 시켜 getter를 쓴것이기 때문에 오류가 날 수 밖에 없었다.
    즉 self.header.next 는 nil값을 리턴하는데 nil에다가 데이터를 넣는격이다

- (void)push:(NSString *)value
{
    [self addNewNode:self.header.next WithValue:value];
}

- (void)addNewNode:(Node *)nowNode WithValue:(NSString *)value 
 {
    
    Node *newNode = [[Node alloc] init];
    newNode.value = value;
    while (nowNode != nil) 
    {
        nowNode = nowNode.next;
    }
    nowNode = newNode;
    newNode.next = nil;
}
*/

//마지막에 넣은 값 출력
- (NSString *)pop {
    return [self popAndDelete:self.header];
}

- (NSString *)popAndDelete:(Node *)nowNode
{
    Node *temNode = [[Node alloc] init];
    //node의 끝을 찾아가려고 했으나 끝의 그이전 노드의 next가 지우려는 부분의 노드를 기억하므로 그 이전의 node를 찾으려고 .next.next를 했다
    while (nowNode.next.next != nil)
    {
        nowNode = nowNode.next;
    }
    temNode = nowNode.next;
    nowNode.next = nil;
    return temNode.value;
}

//빈 스택인지 확인
- (BOOL)isEmpty
{
    return [self isEmptyDetail:self.header];
}
//노드의 다음값이 있는지 없는지를 확인
- (BOOL)isEmptyDetail:(Node *)nowNode
{
    if (nowNode.next == nil)
    {
        NSLog(@"값이 없다");
        return NO;
    }
    NSLog(@"값이 있다");
    return YES;
}

//스트링을 하나하나 뜯어서 비교한다 맞으면

- (BOOL)checkBracketString:(NSString *)string
{   //string을 하나하나 담을 array 객체 생성
    NSMutableArray *stringWithChar = [[NSMutableArray alloc] init];
    //string.length는 글자수를 알려줌
    for (NSInteger i = 0; i < string.length; i += 1)
    {   //substringWithRange:NSMakeRange(i, 1) i번째에, 1개씩 자른다
        [stringWithChar addObject:[string substringWithRange:NSMakeRange(i, 1)]];
        //닫는 괄호는 stack에 저장
        if ([stringWithChar[i] isEqualToString:@"["] || [stringWithChar[i] isEqualToString:@"{"] || [stringWithChar[i] isEqualToString:@"("])
        {
            [self push:stringWithChar[i]];
          //열린괄호가 나올때 stack에 저장한 값 출력
        } else if ([stringWithChar[i] isEqualToString:@"]"] || [stringWithChar[i] isEqualToString:@"}"] || [stringWithChar[i] isEqualToString:@")"]) {
            NSString *tempPop = [self pop];
            
            //비교를 하기위한 괄호 변경
            if ([tempPop isEqualToString: @"["])
            {
                tempPop = @"]";
            } else if ([tempPop isEqualToString: @"{"])
            {
                tempPop = @"}";
            } else if ([tempPop isEqualToString: @"("])
            {
                tempPop = @"(";
            }
            //괄호 변경 후 비교
            if ([stringWithChar[i] isEqualToString:tempPop])
            {
                NSLog(@"괄호를 알맞게 썼습니다");
                return YES;
            } else {
                NSLog(@"괄호를 틀리게 썼습니다");
                return NO;
            }
        }
    }
    return 0;
}
@end
