//
//  SwordWorrior.h
//  Example0923
//
//  Created by david on 2016. 9. 23..
//  Copyright © 2016년 david. All rights reserved.
//

#import "Warrior.h"

/**
 * SwordWorrior 클래스
 * Warrior를 상속 받았다.
 * 요정 속성이 있다.
 * @author 이홍화
 * @verison 0.1
 */
@interface SwordWorrior : Warrior

///요정
@property NSString *fairy;

/**
 * Game데이터 타입인 매개변수 someone을 검공격 한다
 * @author 이홍화
 * @verison 0.1
 * @param someone 공격할 대상
 */
- (id)swordAttackTo:(Game *)someone;

@end
