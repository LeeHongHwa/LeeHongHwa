//
//  GameCharacter.h
//  Example0923
//
//  Created by david on 2016. 9. 23..
//  Copyright © 2016년 david. All rights reserved.
//

#import "Game.h"

/**
 * 게임케릭터 클래스
 * Game을 상속 받았다.
 * 무기, 갑옷, 걸음속도 속성이 있다.
 * @author 이홍화
 * @verison 0.1
 */
@interface GameCharacter : Game

/// 무기
@property NSString *weapon;

/// 갑옷
@property NSString *armor;

/// 걸음속도
@property NSInteger speedPoint;

/**
 * GameCharacter데이터 타입인 매개변수 speedPoint만큼 걸음속도가 증가한다
 * @author 이홍화
 * @verison 0.1
 * @param speedPoint 걸음속도 증가 값
 */
- (id)speedUp:(GameCharacter *)speedPoint;

/**
 * 게임케릭터의 기본 프로퍼티
 * 이름, 레벨, 물리공격럭, 마법공격력, 체력, 마나, 갑옷, 걸음속도를 기본프로퍼티 값으로 지정
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
 */
- (instancetype)initWithName:(NSString *)name
                       level:(NSInteger)level
         physicalAttackPoint:(NSInteger)physicalAttackPoint
          magicalAttackPoint:(NSInteger)magicalAttackPoint
                      health:(NSInteger)health
                        mana:(NSInteger)mana
                      weapon:(NSString *)weapon
                       armor:(NSString *)armor
                   speedPoint:(NSInteger)speedPoint;

@end
