//
//  AxeWarrior.m
//  Example0923
//
//  Created by david on 2016. 9. 23..
//  Copyright © 2016년 david. All rights reserved.
//

#import "AxeWarrior.h"

@implementation AxeWarrior

//도끼공격
- (id)axeAttackTo:(Game *)someone {
    NSLog(@"%@가 %@를 도끼공격 하다", self.name, someone.name);
    return nil;
}

@end
