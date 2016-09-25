//
//  Oak.h
//  Example0923
//
//  Created by david on 2016. 9. 23..
//  Copyright © 2016년 david. All rights reserved.
//

#import "Monster.h"

/**
 * 오크 클래스
 * Monster를 상속 받았다.
 * 몸의색 속성이 있다.
 * @author 이홍화
 * @verison 0.1
 */
@interface Oak : Monster

///몸색상
@property NSString *bodyColor;

/**
 * 소리를 지른다.
 * @author 이홍화
 * @verison 0.1
 */
- (id)shouting;

@end
