//
//  DimensionalShapes.m
//  Example0926
//
//  Created by david on 2016. 9. 26..
//  Copyright © 2016년 david. All rights reserved.
//

#import "DimensionalShapes.h"

@implementation DimensionalShapes

//정사각형 넓이
+ (NSInteger)squareAreaSide:(NSInteger)side {
    return side * side;
}

//정사각형 둘레
+ (NSInteger)squarePerimeterSide:(NSInteger)side {
    return side * 4;
}

//직사각형 넓이
+ (NSInteger)rectangleAreaHeight:(NSInteger)height width:(NSInteger)width {
    return height * width;
}

//직사각형 둘레
+ (NSInteger)rectanglePerimeterHeight:(NSInteger)height width:(NSInteger)width {
    return 2 * (height + width);
}

//원 넓이
+ (CGFloat)circleAreaRadius:(NSInteger)radius {
    return ((CGFloat)radius * (CGFloat)radius) * 3.14;
}

//원 둘레
+ (CGFloat)circleCircumferenceRadius:(NSInteger)radius {
    return 2 * (CGFloat)radius * 3.14;
}

//삼각형 넓이
+ (CGFloat)triangleAreaHeight:(NSInteger)height side:(NSInteger)side {
    return 0.5 * (CGFloat)height * (CGFloat)side;
}

//사다리꼴 넓이
+ (CGFloat)trapezoidAreaHeight:(NSInteger)height upSide:(NSInteger)upSide downSide:(NSInteger)downSide {
    return 0.5 * (CGFloat)height * ((CGFloat)upSide + (CGFloat)downSide);
}

//정육면체 부피
+ (NSInteger)cubeVolumeSide:(NSInteger)side {
    return side * side * side;
}

//직육면체 부피
+ (NSInteger)rectangularSolidVolumeHeight:(NSInteger)height width:(NSInteger)width length:(NSInteger)length {
    return height * width * length;
}

//원기둥 부피
+ (CGFloat)circularCylinderVolumeHeight:(NSInteger)height radius:(NSInteger)radius {
    return 3.14 * ((CGFloat)radius * (CGFloat)radius) * (CGFloat)height;
}

//구 부피
+ (CGFloat)sphereVolumeRadius:(NSInteger)radius {
    return (4.0/3.0) * 3.14 * ((CGFloat)radius * (CGFloat)radius * (CGFloat)radius) ;
}

//월뿔 부피
+ (CGFloat)coneVolumeRadius:(NSInteger)radius height:(NSInteger)height {
    return (1.0/3.0) * 3.14 * (((CGFloat)radius *(CGFloat) radius) * (CGFloat)height);
}

@end
