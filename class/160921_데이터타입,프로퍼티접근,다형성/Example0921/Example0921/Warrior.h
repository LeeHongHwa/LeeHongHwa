//
//  Warrior.h
//  Example0921
//
//  Created by david on 2016. 9. 21..
//  Copyright © 2016년 david. All rights reserved.
//

/**
 * 워리어 클래스
 * 체력이 강하고 마력이 약함
 * 물리공격력이 강하고 마법공격력이 약함
 * @author 이홍화
 * @version 0.1
 */

#import <Foundation/Foundation.h>
@class Wizard;

@interface Warrior : NSObject

/// 워리어의 이름
@property NSString *name;

/// 워리어의 체력
@property NSUInteger health;

/// 워리어의 마력
@property NSUInteger mana;

/// 워리어의 물리공격력
@property NSInteger physicalPower;

/// 워리어의 마법공격력
@property NSInteger magicalPower;

/// 워리어의 생사
@property BOOL isDead;

/**
 * Wizard 데이터타입인 매개변수(someCharacter)의 체력을 워리어객체의 물리공격력 만큼 - 한다
 * @author 이홍화
 * @version 0.1
 * @param someCharacter 물리공격을 받을 대상
 */
- (id)physicalAttackTo:(Wizard *)someCharacter;

/**
 * Wizard 데이터타입인 매개변수(someCharacter)의 체력을 워리어객체의 마법공격력 만큼 - 한다
 * @author 이홍화
 * @version 0.1
 * @param someCharacter 마법공격을 받을 대상
 */
- (id)magicalAttackTo:(Wizard *)someCharacter;

/**
 * NSString 데이터타입인 매개변수(someWhere)로 이동한다
 * @author 이홍화
 * @version 0.1
 * @param someWhere 이동할 장소
 */
- (id)jumpTo:(NSString *)someWhere;


@end
