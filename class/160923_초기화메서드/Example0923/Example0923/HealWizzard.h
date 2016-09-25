//
//  HealWizzard.h
//  Example0923
//
//  Created by david on 2016. 9. 23..
//  Copyright © 2016년 david. All rights reserved.
//

#import "Wizzard.h"

/**
 * HealWizzard 클래스
 * Wizzard를 상속 받았다.
 * 치료력 속성이 있다.
 * @author 이홍화
 * @verison 0.1
 */
@interface HealWizzard : Wizzard

///치료력
@property NSInteger HealingPoint;

/**
 * 스스로에게 치료한다.
 * @author 이홍화
 * @verison 0.1
 */
- (id)healSelf;

@end
