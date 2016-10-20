//
//  main.m
//  ObjectLifeCycle
//
//  Created by david on 2016. 10. 20..
//  Copyright © 2016년 david. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyClass.h"

int main(int argc, const char * argv[]) {

    MyClass *instance = [[MyClass alloc] init];
    NSLog(@"%@",instance);
    instance = nil;
        
    NSLog(@"END");

    return 0;
}
