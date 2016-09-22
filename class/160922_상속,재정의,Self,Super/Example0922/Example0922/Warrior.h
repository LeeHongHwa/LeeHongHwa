//
//  Warrior.h
//  Example0922
//
//  Created by david on 2016. 9. 22..
//  Copyright © 2016년 david. All rights reserved.
//

//어떤애인지 알려줘야 상속이가능하다
#import "GameCharacter.h"

/**
 * 워리어 클래스
 * 게임캐릭터 클래스를 상속받는다
 */
@interface Warrior : GameCharacter

/**
 * 파라미터(location)로 점프를 합니다
 * @author 이홍화
 * @version 0.1
 * @param location 점프를 할 장소
 */
- (id)jumpTo:(NSString *)location;

/**
 * 파라미터(someone)에게 스매시 공격을 합니다
 * @author 이홍화
 * @version 0.1
 * @param someone 스매시 공격을 할 대상
 */
- (id)smashTo:(GameCharacter *)someone;


@end
