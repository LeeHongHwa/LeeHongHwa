//
//  Wizzard.h
//  Example0922
//
//  Created by david on 2016. 9. 22..
//  Copyright © 2016년 david. All rights reserved.
//

#import "GameCharacter.h"

/**
 * 위자드 클래스
 * 게임캐릭터 클래스를 상속받는다
 */
@interface Wizzard : GameCharacter

/**
 * 파라미터(someone)에게 마법공격을 합니다
 * @author 이홍화
 * @version 0.1
 * @param someone 점프를 할 장소
 */
- (id)magiccalAttactTo:(GameCharacter *)someone;

/**
 * 파라미터(location)로 텔레포트 합니다
 * @author 이홍화
 * @version 0.1
 * @param location 점프를 할 장소
 */
- (id)teleportTo:(NSString *)location;


@end
