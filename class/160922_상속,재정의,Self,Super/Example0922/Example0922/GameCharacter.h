//
//  GameCharacter.h
//  Example0922
//
//  Created by david on 2016. 9. 22..
//  Copyright © 2016년 david. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * 게임캐릭터의 공통된 클래스
 * @author 이홍화
 * @version 0.1
 */
@interface GameCharacter : NSObject

///게임캐릭터의 체력
@property NSInteger health;

///게임캐릭터의 마력
@property NSInteger mana;

///게임캐릭터의 물리공격력
@property NSInteger physicalPower;

///게임캐릭터의 마법공격력
@property NSInteger magicalPower;

///게임캐릭터의 생사여부
@property BOOL isDead;

///게임캐릭터의 이름
@property NSString *name;

///게임캐릭터의 무기
@property NSString *weapon;

//이런행위를 할수있습니다.
/**
 * 게임캐릭터의 공통된 메서드
 * 파라미터(someone)에게 물리공격을 한다
 * 자신의 물리공격력 만큼의 데미지를 매개변수(someone)에게 입힌다
 * @author 이홍화
 * @version 0.1
 * @param someone 물리공격 당할 대상
 */
- (id)physicalAttactTo:(GameCharacter *)someone;

@end
