//
//  sampleObject.m
//  TestBlockButton
//
//  Created by david on 2016. 11. 10..
//  Copyright © 2016년 david. All rights reserved.
//

#import "sampleObject.h"
@interface sampleObject()


@end


@implementation sampleObject

- (void)plusNumber:(plusBlock)block
{
    NSLog(@"setblock start");
    self.plusBlock = block;
    NSLog(@"setblock end");
}

- (NSInteger)playMethod:(NSInteger)count
{
    NSLog(@"getblock start");
    return self.plusBlock(count);
}

@end
