//
//  FireWizzard.h
//  Example0923
//
//  Created by david on 2016. 9. 23..
//  Copyright © 2016년 david. All rights reserved.
//

#import "Wizzard.h"

/**
 * FireWizzard 클래스
 * Wizzard를 상속 받았다.
 * 불 방어 속성이 있다.
 * @author 이홍화
 * @verison 0.1
 */
@interface FireWizzard : Wizzard

///불 방어 속성
@property NSInteger fireProtectPoint;

/**
 * GameCharacter데이터 타입인 매개변수 gameCharacter공격을 막는다.
 * @author 이홍화
 * @verison 0.1
 * @param gameCharacter 방어할 대상
 */
- (id)fireProtctTo:(GameCharacter *)gameCharacter;

@end
