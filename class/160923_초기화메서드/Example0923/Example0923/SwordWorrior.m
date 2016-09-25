//
//  SwordWorrior.m
//  Example0923
//
//  Created by david on 2016. 9. 23..
//  Copyright © 2016년 david. All rights reserved.
//

#import "SwordWorrior.h"

@implementation SwordWorrior

//검공격
- (id)swordAttackTo:(Game *)someone {
    NSLog(@"%@가 %@를 검으로 공격 하다", self.name, someone.name);
    return nil;
}


@end
