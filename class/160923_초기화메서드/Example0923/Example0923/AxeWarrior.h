//
//  AxeWarrior.h
//  Example0923
//
//  Created by david on 2016. 9. 23..
//  Copyright © 2016년 david. All rights reserved.
//

#import "Warrior.h"

/**
 * AxeWarrior 클래스
 * Warrior를 상속 받았다.
 * 애완동물 속성이 있다.
 * @author 이홍화
 * @verison 0.1
 */
@interface AxeWarrior : Warrior

///애완동물
@property NSString *pet;

/**
 * Game데이터 타입인 매개변수 someone을 도끼공경을 한다
 * @author 이홍화
 * @verison 0.1
 * @param someone 공격할 대상
 */
- (id)axeAttackTo:(Game *)someone;

@end
