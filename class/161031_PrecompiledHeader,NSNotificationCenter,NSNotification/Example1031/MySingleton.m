//
//  MySingleton.m
//  Example1031
//
//  Created by david on 2016. 10. 31..
//  Copyright © 2016년 david. All rights reserved.
//

#import "MySingleton.h"

@implementation MySingleton

//싱글턴 만들기
+ (instancetype)sharedInstance
{
    static MySingleton *instance = nil;
    static dispatch_once_t token;
    
    dispatch_once(&token, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (void)justMethod
{
    NSLog(@"method called");
}

@end
