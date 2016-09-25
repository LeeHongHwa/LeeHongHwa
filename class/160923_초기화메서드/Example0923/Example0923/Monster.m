//
//  Monster.m
//  Example0923
//
//  Created by david on 2016. 9. 23..
//  Copyright © 2016년 david. All rights reserved.
//

#import "Monster.h"

@implementation Monster

//기본 프로퍼티 값 셋팅
- (instancetype)initWithName:(NSString *)name
                       level:(NSInteger)level
         physicalAttackPoint:(NSInteger)physicalAttackPoint
          magicalAttackPoint:(NSInteger)magicalAttackPoint
                      health:(NSInteger)health
                        mana:(NSInteger)mana
                 respawnTime:(NSInteger)respawnTime {
    self = [super initWithName:name
                         level:level
           physicalAttackPoint:physicalAttackPoint
            magicalAttackPoint:magicalAttackPoint
                        health:health
                          mana:mana];
    self.respawnTime = respawnTime;
    return self;
}

//일정 시간이 지나면 몬스터가 다시 생성 된다.
- (id)responTime {
    NSLog(@"%@후에 리스폰 됩니다", self.responTime);
    return nil;
}

@end
