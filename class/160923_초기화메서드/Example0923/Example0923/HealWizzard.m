//
//  HealWizzard.m
//  Example0923
//
//  Created by david on 2016. 9. 23..
//  Copyright © 2016년 david. All rights reserved.
//

#import "HealWizzard.h"

@implementation HealWizzard

//자기 자신의 체력회복
- (id)healSelf {
    NSLog(@"나(%@)에게 힐했습니다", self.name);
    return nil;
}

@end
