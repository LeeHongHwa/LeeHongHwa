//
//  dimensionalShapes.h
//  Example0926
//
//  Created by david on 2016. 9. 26..
//  Copyright © 2016년 david. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface dimensionalShapes : NSObject

//정사각형 넓이
- (NSInteger)squareAreaSide:(NSInteger)side;

//정사각형 둘레
- (NSInteger)squarePerimeterSide:(NSInteger)side;

//직사각형 넓이
- (NSInteger)rectangleAreaHeight:(NSInteger)height width:(NSInteger)width;

//직사각형 둘레
- (NSInteger)rectanglePerimeterHeight:(NSInteger)height width:(NSInteger)width;

//원 넓이
- (CGFloat)circleAreaRadius:(NSInteger)radius;

//원 둘레
- (CGFloat)circleCircumferenceRadius:(NSInteger)radius;

//삼각형 넓이
- (CGFloat)triangleAreaHeight:(NSInteger)height side:(NSInteger)side;

//사다리꼴 넓이
- (CGFloat)trapezoidAreaHeight:(NSInteger)height upSide:(NSInteger)upSide downSide:(NSInteger)downSide;

//정육면체 부피
- (NSInteger)cubeVolumeSide:(NSInteger)side;

//직육면체 부피
- (NSInteger)rectangularSolidVolumeHeight:(NSInteger)height width:(NSInteger)width length:(NSInteger)length;

//원기둥 부피
- (CGFloat)circularCylinderVolumeHeight:(NSInteger)height radius:(NSInteger)radius;

//구 부피
- (CGFloat)sphereVolumeRadius:(NSInteger)radius;

//월뿔 부피
- (CGFloat)coneVolumeRadius:(NSInteger)radius height:(NSInteger)height;
@end
