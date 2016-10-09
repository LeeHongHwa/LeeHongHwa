//
//  ForExample.h
//  Example1004
//
//  Created by david on 2016. 10. 4..
//  Copyright © 2016년 david. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ForExample : NSObject

/**
 구구단
 @author 이홍화
 @version 0.1
 */
+ (void)getMultiplication:(NSInteger)number;

/**
 팩토리얼
 @author 이홍화
 @version 0.1
 */
+ (void)factorial:(NSInteger)number;

/**
 삼각수
 @author 이홍화
 @version 0.1
 */
+ (void)triangularNum:(NSInteger)number;

/**
 각 자리수 더하는 메서드
 @author 이홍화
 @version 0.1
 */
+ (void)addAllNum:(NSInteger)number;

/**
 3 6 9 게임
 @author 이홍화
 @version 0.1
 */
+ (id)game369:(NSInteger)number;


@end
