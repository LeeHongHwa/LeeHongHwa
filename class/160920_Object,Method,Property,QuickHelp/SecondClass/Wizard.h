//
//  Wizard.h
//  SecondClass
//
//  Created by david on 2016. 9. 20..
//  Copyright © 2016년 david. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * 위자드를 만드는 클래스
 * 물리공격력 약하고 마법공격력 강합니다
 * 체력이 낮고 마력이 높습니다
 * @autour 이홍화
 * @verison 0.1
 */
@interface Wizard : NSObject

/// Wizard의 이름 입니다
@property id name;

/// Wizard의 체력 입니다
@property id health;

/// Wizard의 마력 입니다
@property id mana;

/// Wizard의 물리공격력 입니다
@property id physicalPower;

/// Wizard의 마법공격력 입니다
@property id magicalPower;

/// Wizard의 무기 입니다
@property id weapon;

/// 화염공격
- (id)fire;

/// 번개공격
- (id)thunder;

///얼음공격
- (id)cold;

///바람공격
- (id)wind;

/**
 * 화염공격
 * @autour 이홍화
 * @verison 0.1
 * @param human 공격받는 사람
 */
- (id)fireTo:(id)human;

/**
 * 폭풍공격
 * @autour 이홍화
 * @verison 0.1
 * @param to 공격받는 사람
 */
- (id)windstorm:(id)to;

/**
 * 마법공격
 * @autour 이홍화
 * @verison 0.1
 * @param to 공격받는 사람
 */
- (id)magicalAttack:(id)to;

/**
 * 치료
 * @autour 이홍화
 * @verison 0.1
 * @param to 치료받는 사람
 */
- (id)heal:(id)to;

@end
