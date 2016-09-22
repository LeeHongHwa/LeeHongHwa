//
//  GameCharacter.m
//  Example0922
//
//  Created by david on 2016. 9. 22..
//  Copyright © 2016년 david. All rights reserved.
//

#import "GameCharacter.h"

@implementation GameCharacter

- (id)physicalAttactTo:(GameCharacter *)someone {
    
    //매개변수의 현재 체력
    NSInteger originHealth = someone.health;
    
    //매개변수가 공격을 당한 후 체력
    someone.health = (originHealth - self.physicalPower);
    
    //로그
    NSLog(@"%@가 %@를 공격했습니다 그로인해 %@의 체력(%ld)이 %ld로 감소했습니다", self.name, someone.name, someone.name,originHealth, someone.health);
    
    return nil;
}
//  한번 생각해 보기
//- (id)physicalAttactTo:(GameCharacter *)someone {
//    [someone damagedAs:self.physicalPower];
//    return nil;
//}
//- (id)damagedAs:(NSInteger)damage {
//    self.health = self.health - damage;
//    return nil;
//}

@end
