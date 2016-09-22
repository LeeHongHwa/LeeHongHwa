//
//  Wizard.h
//  Example0921
//
//  Created by david on 2016. 9. 21..
//  Copyright © 2016년 david. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Warrior;

/**
 * 위자드 클래스
 * 체력이 약하고 마력이 강함
 * 물리공격력이 약하고 마법공격력이 강함
 * @author 이홍화
 * @version 0.1
 */

@interface Wizard : NSObject

///위자드의 이름
@property NSString *name;

///위자드의 체력
@property NSUInteger health;

///위자드의 마력
@property NSUInteger mana;

///위자드의 물리공격력
@property NSInteger physicalPower;

///위자드의 마법공격력
@property NSInteger magicalPower;

///위자드의 체력치유력
@property NSUInteger healingPoint;

///위자드의 생사
@property BOOL isDead;

/**
 * Warrior 데이터타입인 매개변수(someCharacter)의 체력을 위자드객체의 물리공격력 만큼 - 한다
 * @author 이홍화
 * @version 0.1
 * @param someCharacter 물리공격을 받을 대상
 */
- (id)physicalAttackToWarrior:(Warrior *)someCharacter;

/**
 * Warrior 데이터타입인 매개변수(someCharacter)의 체력을 위자드객체의 마법공격력 만큼 - 한다
 * @author 이홍화
 * @version 0.1
 * @param someCharacter 마법공격을 받을 대상
 */
- (id)energyBoltAttackToWarrior:(Warrior *)someCharacter;

/**
 * NSString 데이터타입인 매개변수(someWhere)로 이동한다
 * @author 이홍화
 * @version 0.1
 * @param someWhere 이동할 장소
 */
- (id)teleportTo:(NSString *)someWhere;

/**
 * 자신의 체력을 healingPoint만큼 치료한다
 * @author 이홍화
 * @version 0.1
 */
- (id)healSelf;

@end
