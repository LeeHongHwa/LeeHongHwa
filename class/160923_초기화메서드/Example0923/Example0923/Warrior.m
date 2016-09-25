//
//  Warrior.m
//  Example0923
//
//  Created by david on 2016. 9. 23..
//  Copyright © 2016년 david. All rights reserved.
//

#import "Warrior.h"

@implementation Warrior

//초기 프로퍼티 셋팅값 지정
- (instancetype)initWithName:(NSString *)name
                       level:(NSInteger)level
         physicalAttackPoint:(NSInteger)physicalAttackPoint
          magicalAttackPoint:(NSInteger)magicalAttackPoint
                      health:(NSInteger)health
                        mana:(NSInteger)mana
                      weapon:(NSString *)weapon
                       armor:(NSString *)armor
                  speedPoint:(NSInteger)speedPoint
                      shield:(NSString *)shield {
    
    self = [self initWithName:name
                        level:level
          physicalAttackPoint:physicalAttackPoint
           magicalAttackPoint:magicalAttackPoint
                       health:health
                         mana:mana
                       weapon:weapon
                        armor:armor
                   speedPoint:speedPoint
            ];
    
    self.shield = shield;
    return self;
    
}

//스턴공격
- (id)sturnTo:(Game *)someone {
    NSLog(@"%@가 %@를 스턴공격을 하다", self.name, someone.name);
    return nil;
}

//돌진공격
- (id)dashTo:(Game *)someone {
    NSLog(@"%@가 %@를 돌진공격을 하다", self.name, someone.name);
    return nil;
}

@end
