//
//  Wizard.m
//  Example0921
//
//  Created by david on 2016. 9. 21..
//  Copyright © 2016년 david. All rights reserved.
//

#import "Wizard.h"
#import "Warrior.h"

@implementation Wizard

- (id)physicalAttackToWarrior:(Warrior *)someCharacter {
    
    //워리어의 이전 체력
    NSUInteger originHealth = someCharacter.health;
    
    //위자드의 공격 후 워리어의 체력
    someCharacter.health = originHealth - self.physicalPower;
    
    //로그
    NSLog(@"\n마법사(%@)가 전사(%@)에게 물리공격을 가하여 %lu의 데미지를 입혔습니다\n전사(%@)의 체력이 %lu에서 %lu로 변경되었습니다", self.name, someCharacter.name, self.physicalPower, someCharacter.name, originHealth, someCharacter.health);
    
    return nil;
    
}

- (id)energyBoltAttackToWarrior:(Warrior *)someCharacter {
 
    
    //워리어 이전 체력
    NSInteger originHealth = someCharacter.health;
    
    //위자드의 공격 후 워리어의 체력
    someCharacter.health = originHealth - self.magicalPower;
    
    //로그
    NSLog(@"\n마법사(%@)가 전사(%@)에게 마법공격을 가하여 %lu의 데미지를 입혔습니다\n전사(%@)의 체력이 %ld에서 %ld로 변경되었습니다", self.name, someCharacter.name, self.magicalPower, someCharacter.name, originHealth, someCharacter.health);
    
    return nil;
    
}

- (id)teleportTo:(NSString *)someWhere {
    
    //위자드가 이동
    NSLog(@"%@로 이동했습니다.", someWhere);
    return nil;
}

- (id)healSelf {

    //현재 나의 체력
    NSUInteger originHealth = self.health;
    
    //힐링을 하고 난뒤 나의 체력
    self.health = self.health + self.healingPoint;
    
    //로그
    NSLog(@"\n마법사(%@)의 기존 체력(%lu)이 %lu만큼 회복되서 체력이 %lu가 되었습니다", self.name, originHealth, self.healingPoint, self.health);
    return nil;
}

@end
