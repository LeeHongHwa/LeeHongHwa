//
//  Bird.m
//  Example0922
//
//  Created by david on 2016. 9. 22..
//  Copyright © 2016년 david. All rights reserved.
//

#import "Bird.h"

@implementation Bird

- (id)cryAsSound:(Animal *)sound {
    NSLog(@"%@운다 Bird", sound.cryingSound);
    return nil;
}

@end
