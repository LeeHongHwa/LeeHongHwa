//
//  Animal.h
//  Example0922
//
//  Created by david on 2016. 9. 22..
//  Copyright © 2016년 david. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * 동물의 공통적인 특성을 가지고 있는 클래스
 * @author 이홍화
 * @version 0.1
 */
@interface Animal : NSObject

///동물의 울음소리
@property NSString *cryingSound;

///동물의 이름
@property NSString *name;

/**
 * 동물의 울음소리를 출력하는 메서드
 * @author 이홍화
 * @version 0.1
 * @param sound 동물의 울음소리
 */
- (id)cryAsSound:(Animal *)sound;

@end
