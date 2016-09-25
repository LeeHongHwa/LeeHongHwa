//
//  Warrior.h
//  Example0923
//
//  Created by david on 2016. 9. 23..
//  Copyright © 2016년 david. All rights reserved.
//

#import "GameCharacter.h"

/**
 * 워리어 클래스
 * GameCharacter를 상속 받았다.
 * 방패 속성이 있다.
 * @author 이홍화
 * @verison 0.1
 */
@interface Warrior : GameCharacter

@property NSString *shield;

/**
 * Warrior의 기본 프로퍼티
 * 이름, 레벨, 물리공격럭, 마법공격력, 체력, 마나, 갑옷, 걸음속도, 방패 속성을 기본프로퍼티 값으로 지정
 * @author 이홍화
 * @verison 0.1
 * @param name 이름
 * @param level 레벨
 * @param physicalAttackPoint 물리공격력
 * @param magicalAttackPoint 마법공격력
 * @param health 체력
 * @param mana 마나
 * @param armor 갑옷
 * @param speedPoint 걸음속도
 * @param shield 방패
 */
- (instancetype)initWithName:(NSString *)name
                       level:(NSInteger)level
         physicalAttackPoint:(NSInteger)physicalAttackPoint
          magicalAttackPoint:(NSInteger)magicalAttackPoint
                      health:(NSInteger)health
                        mana:(NSInteger)mana
                      weapon:(NSString *)weapon
                       armor:(NSString *)armor
                  speedPoint:(NSInteger)speedPoint
                      shield:(NSString *)shield;

/**
 * Game데이터 타입인 매개변수 someone을 스턴공격 한다
 * @author 이홍화
 * @verison 0.1
 * @param someone 공격할 대상
 */
- (id)sturnTo:(Game *)someone;

/**
 * Game데이터 타입인 매개변수 someone을 돌진공격 한다
 * @author 이홍화
 * @verison 0.1
 * @param someone 공격할 대상
 */
- (id)dashTo:(Game *)someone;

@end
