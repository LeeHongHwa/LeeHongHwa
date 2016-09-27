//
//  IfExample.h
//  Example0926
//
//  Created by david on 2016. 9. 26..
//  Copyright © 2016년 david. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 * 짝수 구분 클래스
 * @author 이홍화
 * @version 0.1
 */
@interface IfExample : NSObject

/**
 * 방법 1
 * 짝수 구분 클래스
 * @author 이홍화
 * @version 0.1
 * @param number 확인해 볼 숫자
 */
+ (BOOL)isEvenNumber:(NSInteger)number;

/**
 * 방법 2
 * 짝수 구분 클래스
 * @author 이홍화
 * @version 0.1
 * @param number 확인해 볼 숫자
 */
+ (BOOL)isEvenNumber2:(NSInteger)number;
@end
