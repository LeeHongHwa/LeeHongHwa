//
//  Game.h
//  Example0923
//
//  Created by david on 2016. 9. 23..
//  Copyright © 2016년 david. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * 게임 클래스
 * NSObject를 상속 받았다.
 * 이름, 레벨, 물리공격력, 마법공격력, 체력, 마나 속성이 있다.
 * @author 이홍화
 * @verison 0.1
 */
@interface Game : NSObject

///이름
@property NSString *name;

///레벨
@property NSInteger level;

///물리공격력
@property NSInteger physicalAttackPoint;

///마법공격력
@property NSInteger magicalAttackPoint;

///체력
@property NSInteger health;

///마력
@property NSInteger mana;

/**
 * Game데이터 타입인 매개변수 someone에게 물리적 공격을 한다.
 * @author 이홍화
 * @verison 0.1
 * @param someone 공격할 대상
 */
- (id)physicalAttack:(Game *)someone;

/**
 * Game데이터 타입인 매개변수 someone에게 마법공격을 한다.
 * @author 이홍화
 * @verison 0.1
 * @param someone 공격할 대상
 */
- (id)magicalAttack:(Game *)someone;

/**
 * 이름, 레벨, 물리공격럭, 마법공격력, 체력, 마나를 기본프로퍼티 값으로 지정
 * @author 이홍화
 * @verison 0.1
 * @param name 이름
 * @param level 레벨
 * @param physicalAttackPoint 물리공격력
 * @param magicalAttackPoint 마법공격력
 * @param health 체력
 * @param mana 마나
 */
- (instancetype)initWithName:(NSString *)name
                       level:(NSInteger)level
         physicalAttackPoint:(NSInteger)physicalAttackPoint
          magicalAttackPoint:(NSInteger)magicalAttackPoint
                      health:(NSInteger)health
                        mana:(NSInteger)mana;

@end
