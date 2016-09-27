//
//  ToolBox.h
//  Example0926
//
//  Created by david on 2016. 9. 26..
//  Copyright © 2016년 david. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 * 변환 클래스
 * (인치,cm,평,제곱미터,화씨,섭씨,메가바이트,기가바이트,키로바이트,시간,초)
 * @author 이홍화
 * @version 0.1
 */
@interface ToolBox : NSObject

/**
 * inch를 cm로 변환하는 클래스 메서드
 * @author 이홍화
 * @version 0.1
 * @param inch 인치
 */
+ (CGFloat)inchToCm:(CGFloat)inch;

/**
 * cm를 inch로 변환하는 클래스 메서드
 * @author 이홍화
 * @version 0.1
 * @param cm cm
 */
+ (CGFloat)cmToInch:(CGFloat)cm;

/**
 * 제곱미터를 평으로 변환하는 클래스 메서드
 * @author 이홍화
 * @version 0.1
 * @param squareMeters 제곱미터
 */
+ (CGFloat)squareMetersToflat:(CGFloat)squareMeters;

/**
 * 평을 제곱미터로 변환하는 클래스 메서드
 * @author 이홍화
 * @version 0.1
 * @param flat 평
 */
+ (CGFloat)flatTosquareMeters:(CGFloat)flat;

/**
 * 화씨를 섭씨로 변환하는 클래스 메서드
 * @author 이홍화
 * @version 0.1
 * @param fahrenheit 화씨
 */
+ (CGFloat)fahrenheitToCelsius:(CGFloat)fahrenheit;

/**
 * 섭씨를 화씨로 변환하는 클래스 메서드
 * @author 이홍화
 * @version 0.1
 * @param celsius 섭씨
 */
+ (CGFloat)celsiusToFahrenheit:(CGFloat)celsius;

/**
 * KB를 MB로 변환하는 클래스 메서드
 * @author 이홍화
 * @version 0.1
 * @param KB 키로바이트
 */
+ (CGFloat)KBToMB:(CGFloat)KB;

/**
 * MB를 GB로 변환하는 클래스 메서드
 * @author 이홍화
 * @version 0.1
 * @param MB 메가바이트
 */
+ (CGFloat)MBToGB:(CGFloat)MB;


/**
 * 시간을 초로 변환하는 클래스 메서드
 * @author 이홍화
 * @version 0.1
 * @param hour 시
 * @param minute 분
 * @param second 초
 */
+ (NSInteger)timeToSecond:(NSInteger)hour minute:(NSInteger)minute second:(NSInteger)second;

/**
 * 초를 시간으로 변환하는 클래스 메서드
 * @author 이홍화
 * @version 0.1
 * @param second 초
 */
+ (NSInteger)secondToTime:(NSInteger)second;


@end
