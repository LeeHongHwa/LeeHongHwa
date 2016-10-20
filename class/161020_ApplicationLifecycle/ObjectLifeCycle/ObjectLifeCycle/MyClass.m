//
//  MyClass.m
//  ObjectLifeCycle
//
//  Created by david on 2016. 10. 20..
//  Copyright © 2016년 david. All rights reserved.
//

#import "MyClass.h"

@implementation MyClass

/**
 alloc을 통해 객체를 메모리에서 생성.
 */
+ (instancetype)alloc
{   NSLog(@"My Class instance alloc");
    return [super alloc];
}

/**
 dealloc을 통해 객체를 메모리에서 해제
 ARC(Automatic Reference Counting)때문에 dealloc 메서드를 호출 안하고 nil값을 주면 자동으로 객체가 메모리에서 해제된다.
 */
- (void)dealloc
{
    NSLog(@"My Class instance dealloc");
}

/**
 init을 통해 객체 초기화
 new를 사용하는경우 alloc과 init을 한꺼번에 처리해서 init을 override를 고려한다면 alloc과 init을 따로 해주어야한다.
 */
- (instancetype)init
{
    NSLog(@"My Class instance init");
    return [super init];
}

@end
