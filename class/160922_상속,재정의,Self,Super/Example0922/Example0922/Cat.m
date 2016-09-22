//
//  Cat.m
//  Example0922
//
//  Created by david on 2016. 9. 22..
//  Copyright © 2016년 david. All rights reserved.
//

#import "Cat.h"

@implementation Cat

- (id)cryAsSound:(Animal *)sound {
    NSLog(@"%@운다 Cat", sound.cryingSound);
    return nil;
}

@end
