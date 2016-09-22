//
//  Warrior.m
//  Example0921
//
//  Created by david on 2016. 9. 21..
//  Copyright © 2016년 david. All rights reserved.
//

#import "Warrior.h"
#import "Wizard.h"

@implementation Warrior

- (id)physicalAttackTo:(Wizard *)someCharacter {
    
    //위자드의 이전 체력
    NSUInteger originHealth = someCharacter.health;
    
    //워리어의 공격 후 위자드의 체력
    someCharacter.health = originHealth - self.physicalPower;
    
    //로그
    NSLog(@"\n전사(%@)가 마법사(%@)에게 물리공격을 가하여 %lu의 데미지를 입혔습니다\n마법사(%@)의 체력이 %lu에서 %lu로 변경되었습니다", self.name, someCharacter.name, self.physicalPower, someCharacter.name, originHealth, someCharacter.health);
    
    return nil;
}

- (id)magicalAttackTo:(Wizard *)someCharacter {
    
    //위자드의 이전 체력
    NSInteger originHealth = someCharacter.health;
    
    //워리어의 공격 후 위자드의 체력
    someCharacter.health = originHealth - self.magicalPower;
    
    //로그
    NSLog(@"\n전사(%@)가 마법사(%@)에게 마법공격을 가하여 %lu의 데미지를 입혔습니다\n마법사(%@)의 체력이 %ld에서 %ld로 변경되었습니다", self.name, someCharacter.name, self.magicalPower, someCharacter.name, originHealth, someCharacter.health);
    
    return nil;
}

- (id)jumpTo:(NSString *)someWhere {
    
    //워리어가 이동
    NSLog(@"%@로 이동했습니다.", someWhere);
    return nil;
}

@end
