//
//  Wizzard.m
//  Example0923
//
//  Created by david on 2016. 9. 23..
//  Copyright © 2016년 david. All rights reserved.
//

#import "Wizzard.h"

@implementation Wizzard

//기본 프로퍼티 값 셋팅
- (instancetype)initWithName:(NSString *)name
                       level:(NSInteger)level
         physicalAttackPoint:(NSInteger)physicalAttackPoint
          magicalAttackPoint:(NSInteger)magicalAttackPoint
                      health:(NSInteger)health
                        mana:(NSInteger)mana
                      weapon:(NSString *)weapon
                       armor:(NSString *)armor
                  speedPoint:(NSInteger)speedPoint
                  magicGrade:(NSString *)magicGrade {
    self = [super initWithName:name
                         level:level
           physicalAttackPoint:physicalAttackPoint
            magicalAttackPoint:magicalAttackPoint
                        health:health
                          mana:mana
                        weapon:weapon
                         armor:armor
                    speedPoint:speedPoint];
    self.magicGrade = magicGrade;
    return self;
}

//에너지화살 공격
- (id)energyArrow:(Game *)someone {
    NSLog(@"%@가 %@에게 에너지볼트 공격을 하다", self.name, someone.name);
    return nil;
}

@end
