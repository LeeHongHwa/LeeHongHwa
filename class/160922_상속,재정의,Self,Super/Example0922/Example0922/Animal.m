//
//  Animal.m
//  Example0922
//
//  Created by david on 2016. 9. 22..
//  Copyright © 2016년 david. All rights reserved.
//

#import "Animal.h"

@implementation Animal

- (id)cryAsSound:(Animal *)sound {
    NSLog(@"%@운다 Animal", sound.cryingSound);
    return nil;
}

@end
