//
//  Person.m
//  SecondClass
//
//  Created by david on 2016. 9. 20..
//  Copyright © 2016년 david. All rights reserved.
//

#import "Person.h"

@implementation Person

- (id)run:(id)where {
    NSLog(@"%@으로 뛴다", where);
    return nil;
}

- (id)runTo:(id)where bySpeed:(id)speed with:(id)someone {
    NSLog(@"%@에서 %@ %@와 함께 달린다.",where ,speed ,someone);
    return nil;
}

- (id)call:(id)who {
    NSLog(@"%@에게 전화한다", who);
    return nil;
}

@end
