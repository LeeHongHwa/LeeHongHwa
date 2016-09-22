//
//  Warrior.h
//  SecondClass
//
//  Created by david on 2016. 9. 20..
//  Copyright © 2016년 david. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 * 전사를 만드는 클래스
 * 물리공격력 세고 마법공격력 약합니다
 * 체력이 높고 마력이 약합니다
 * @discussion 전사가 갖추어야 할 property와 method는 무엇이 있을까?
 * @autour 이홍화
 * @verison 0.1
 */
@interface Warrior : NSObject

/// Warrior의 이름 입니다
@property id name;

/// Warrior의 체력 입니다
@property id health;

/// Warrior의 마력 입니다
@property id mana;

/// Warrior의 물리공격력 입니다
@property id physicalPower;

/// Warrior의 마법공격력 입니다
@property id magicalPower;

/// Warrior의 무기 입니다
@property id weapon;

/**
 * monster(상대방)에게 sturn(공격)을 합니다.
 * @param monster sturn 공격을 당할 대상
 * @autor 이홍화
 * @verison 0.1
 */
- (id)sturn:(id)monster;

/**
 * human(상대방)에게 attack(공격)을 합니다.
 * @param human sturn 공격을 당할 대상
 * @autor 이홍화
 * @verison 0.1
 */
- (id)attack:(id)human;

/**
 * monster(상대방)에게 number(횟수)번 who(나와 같이 공격할 대상)와 같이 attack(공격)을 합니다.
 * @param monster sturn 공격을 당할 대상
 * @param number attackTo하는 횟수
 * @param who 같이 attackTo하는 사람
 * @autor 이홍화
 * @verison 0.1
 */
- (id)attackTo:(id)monster hit:(id)number with:(id)who;

/**
 * 자신의 방어력을 낮추고 공격력 상승
 * @autor 이홍화
 * @verison 0.1
 */
- (id)berserker;

/**
 * 달리기 속도 상승
 * @autor 이홍화
 * @verison 0.1
 */
- (id)run;

@end
