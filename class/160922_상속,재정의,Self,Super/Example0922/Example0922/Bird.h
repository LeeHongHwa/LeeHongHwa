//
//  Bird.h
//  Example0922
//
//  Created by david on 2016. 9. 22..
//  Copyright © 2016년 david. All rights reserved.
//

#import "Animal.h"

/**
 * Animal클래스를 상속 받는 새 클래스
 * @author 이홍화
 * @version 0.1
 */
@interface Bird : Animal

/**
 * override
 * 새의 울음소리를 출력하는 메서드
 * @author 이홍화
 * @version 0.1
 * @param sound 새의 울음소리
 */
- (id)cryAsSound:(Animal *)sound;

@end
