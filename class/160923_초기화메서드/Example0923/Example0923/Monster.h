//
//  Monster.h
//  Example0923
//
//  Created by david on 2016. 9. 23..
//  Copyright © 2016년 david. All rights reserved.
//

#import "Game.h"

/**
 * Monster 클래스
 * GameCharacter를 상속 받았다.
 * 리스폰 타임 속성이 있다.
 * @author 이홍화
 * @verison 0.1
 */
@interface Monster : Game

///재생성되는 시간
@property NSInteger respawnTime;

/**
 * 이름, 레벨, 물리공격럭, 마법공격력, 체력, 마나, 리스폰 타임 속성을 기본프로퍼티 값으로 지정
 * @author 이홍화
 * @verison 0.1
 * @param name 이름
 * @param level 레벨
 * @param physicalAttackPoint 물리공격력
 * @param magicalAttackPoint 마법공격력
 * @param health 체력
 * @param mana 마나
 * @param respawnTime 리스폰 타임
 */
- (instancetype)initWithName:(NSString *)name
                       level:(NSInteger)level
         physicalAttackPoint:(NSInteger)physicalAttackPoint
          magicalAttackPoint:(NSInteger)magicalAttackPoint
                      health:(NSInteger)health
                        mana:(NSInteger)mana
                 respawnTime:(NSInteger)respawnTime;

/**
 * 일정시간이 지나면 다시 재생성된다.
 * @author 이홍화
 * @verison 0.1
 */
- (id)responTime;

@end
