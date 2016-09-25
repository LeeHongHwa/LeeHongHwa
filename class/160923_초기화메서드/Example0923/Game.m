//
//  Game.m
//  Example0923
//
//  Created by david on 2016. 9. 23..
//  Copyright © 2016년 david. All rights reserved.
//
#import "Game.h"

@implementation Game

//물리공격을 합니다
- (id)physicalAttack:(Game *)someone {
    NSLog(@"적(%@)을 공격합니다", someone.name);
    return nil;
}

//마법공격을 합니다
- (id)magicalAttack:(Game *)someone {
    NSLog(@"적(%@)을 공격합니다", someone.name);
    return nil;
}

//기본 프로퍼티 값을 지정합니다
- (instancetype)initWithName:(NSString *)name
                       level:(NSInteger)level
         physicalAttackPoint:(NSInteger)physicalAttackPoint
          magicalAttackPoint:(NSInteger)magicalAttackPoint
                      health:(NSInteger)health
                        mana:(NSInteger)mana {

    self.name = name;
    self.level = level;
    self.physicalAttackPoint = physicalAttackPoint;
    self.magicalAttackPoint = magicalAttackPoint;
    self.health = health;
    self.mana = mana;
    
    return self;
}
@end
