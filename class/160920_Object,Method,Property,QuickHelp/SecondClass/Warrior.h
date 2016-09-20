//
//  Warrior.h
//  SecondClass
//
//  Created by david on 2016. 9. 20..
//  Copyright © 2016년 david. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *description 전사를 만드는 클래스 입니다.
 *무기와 HP, MP, health 속성이 있습니다.
 *스턴, 어택, 버서커, 런의 메서드가 있습니다.
 */
@interface Warrior : NSObject

@property id name;

// helth를 1을 증가 시키면 physicalPower가 15씩 증가 합니다.
@property id health;

// 전사의 체력을 나타냅니다.
@property id physicalPower;

// 전사의 마력을 나타냅니다.
@property id magicalPower;

// 전사의 무기를 나타냅니다.
@property id weapon;

// 적에게 80%의 데미지, 30%확률로 기절
- (id)sturn:(id)monster;

// 적에게 150%의 데미지
- (id)attack:(id)human;

// 몬스터에게 몇번 누구와 같이 때리다.
- (id)attackTo:(id)monster hit:(id)number with:(id)who;

// 자신의 방어력을 낮추고 공격력 상승
- (id)berserker;

// 달리기 속도 150% 상승
- (id)run;

@end
