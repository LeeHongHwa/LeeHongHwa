//
//  GameCharacter.m
//  Example0923
//
//  Created by david on 2016. 9. 23..
//  Copyright © 2016년 david. All rights reserved.
//

#import "GameCharacter.h"

@implementation GameCharacter

//이동속도 증가
- (id)speedUp:(GameCharacter *)speedPoint {
    NSLog(@"%ld만큼 달리기 속도가 증가하였습니다",speedPoint.speedPoint);//값이니깐 %ld
    return nil;
}

//기본 프로퍼티 값 셋팅
- (instancetype)initWithName:(NSString *)name
                       level:(NSInteger)level
         physicalAttackPoint:(NSInteger)physicalAttackPoint
          magicalAttackPoint:(NSInteger)magicalAttackPoint
                      health:(NSInteger)health
                        mana:(NSInteger)mana
                      weapon:(NSString *)weapon
                       armor:(NSString *)armor
                  speedPoint:(NSInteger)speedPoint {
    
    self = [self initWithName:name
                        level:level
          physicalAttackPoint:physicalAttackPoint
           magicalAttackPoint:magicalAttackPoint
                       health:health
                         mana:mana];
    
    self.weapon = weapon;
    self.armor = armor;
    
    return self;
}

@end
