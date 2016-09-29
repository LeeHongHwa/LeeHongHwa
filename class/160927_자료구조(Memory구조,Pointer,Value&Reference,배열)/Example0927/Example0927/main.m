//
//  main.m
//  Example0927
//
//  Created by david on 2016. 9. 27..
//  Copyright © 2016년 david. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *structTest = [[Person alloc] init];
        [structTest setHeight:23.5 weight:50.5];
        NSLog(@"%lf",[structTest personInfo].height);
        
    }
    return 0;
}
