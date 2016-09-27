//
//  DimensionalShapes.h
//  Example0926
//
//  Created by david on 2016. 9. 26..
//  Copyright © 2016년 david. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * 도형의 넓이,둘레,부피를 구하는 클래스
 * @author 이홍화
 * @version 0.1
 */
@interface DimensionalShapes : NSObject

/**
 * 정사각형 넓이를 구하는 메서드
 * @author 이홍화
 * @version 0.1
 * @param side 한변의 길이
 */
+ (NSInteger)squareAreaSide:(NSInteger)side;

/**
 * 정사각형 둘레를 구하는 메서드
 * @author 이홍화
 * @version 0.1
 * @param side 한변의 길이
 */
+ (NSInteger)squarePerimeterSide:(NSInteger)side;

/**
 * 직사각형 넓이를 구하는 메서드
 * @author 이홍화
 * @version 0.1
 * @param height 높이
 * @param width 가로
 */
+ (NSInteger)rectangleAreaHeight:(NSInteger)height width:(NSInteger)width;

/**
 * 직사각형 둘레를 구하는 메서드
 * @author 이홍화
 * @version 0.1
 * @param height 높이
 * @param width 가로
 */
+ (NSInteger)rectanglePerimeterHeight:(NSInteger)height width:(NSInteger)width;

/**
 * 원 넓이를 구하는 메서드
 * @author 이홍화
 * @version 0.1
 * @param radius 반지름
 */
+ (CGFloat)circleAreaRadius:(NSInteger)radius;

/**
 * 원 둘레를 구하는 메서드
 * @author 이홍화
 * @version 0.1
 * @param radius 반지름
 */
+ (CGFloat)circleCircumferenceRadius:(NSInteger)radius;

/**
 * 삼각형 넓이를 구하는 메서드
 * @author 이홍화
 * @version 0.1
 * @param height 높이
 * @param side 밑변
 */
+ (CGFloat)triangleAreaHeight:(NSInteger)height side:(NSInteger)side;

/**
 * 사다리꼴 넓이를 구하는 메서드
 * @author 이홍화
 * @version 0.1
 * @param height 높이
 * @param upSide 윗변
 * @param downSide 밑변
 */
+ (CGFloat)trapezoidAreaHeight:(NSInteger)height upSide:(NSInteger)upSide downSide:(NSInteger)downSide;

/**
 * 정육면체 부피를 구하는 메서드
 * @author 이홍화
 * @version 0.1
 * @param side 한변의 길이
 */
+ (NSInteger)cubeVolumeSide:(NSInteger)side;

/**
 * 직육면체 부피를 구하는 메서드
 * @author 이홍화
 * @version 0.1
 * @param height 높이
 * @param width 가로
 * @param length 세로
 */
+ (NSInteger)rectangularSolidVolumeHeight:(NSInteger)height width:(NSInteger)width length:(NSInteger)length;

/**
 * 원기둥 부피를 구하는 메서드
 * @author 이홍화
 * @version 0.1
 * @param height 높이
 * @param radius 반지름
 */
+ (CGFloat)circularCylinderVolumeHeight:(NSInteger)height radius:(NSInteger)radius;

/**
 * 구 부피를 구하는 메서드
 * @author 이홍화
 * @version 0.1
 * @param radius 반지름
 */
+ (CGFloat)sphereVolumeRadius:(NSInteger)radius;

/**
 * 원뿔 부피를 구하는 메서드
 * @author 이홍화
 * @version 0.1
 * @param radius 반지름
 * @param height 높이
 */
+ (CGFloat)coneVolumeRadius:(NSInteger)radius height:(NSInteger)height;
@end
