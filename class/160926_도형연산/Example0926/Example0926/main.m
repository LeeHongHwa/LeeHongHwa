//
//  main.m
//  Example0926
//
//  Created by david on 2016. 9. 26..
//  Copyright © 2016년 david. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CalculationSubject.h"
#import "dimensionalShapes.h"

int main(int argc, const char * argv[]) {

    CalculationSubject *calculator = [[CalculationSubject alloc] init];
    
    //인티저일때만 나머지가 있다.
    [calculator addScore:70];
    [calculator addScore:70];
    [calculator addScore:70];
    [calculator addScore:70];
    [calculator average];
    
    dimensionalShapes *shapeCalculator = [[dimensionalShapes alloc] init];
    
    NSLog(@"정사각형 넓이 %ld", [shapeCalculator squareAreaSide:5]);
    
    NSLog(@"정사각형 둘레 %ld", [shapeCalculator squarePerimeterSide:5]);
    
    NSLog(@"직사각형 넓이 %ld", [shapeCalculator rectangleAreaHeight:5 width:8]);
    
    NSLog(@"직사각형 둘레 %ld", [shapeCalculator rectanglePerimeterHeight:5 width:8]);
    
    NSLog(@"원 넓이 %lf", [shapeCalculator circleAreaRadius:8]);
    
    NSLog(@"원 둘레 %lf", [shapeCalculator circleCircumferenceRadius:8]);
    
    NSLog(@"삼각형 넓이 %lf", [shapeCalculator triangleAreaHeight:12 side:8]);
    
    NSLog(@"사다리꼴 넓이 %lf", [shapeCalculator trapezoidAreaHeight:12 upSide:4 downSide:8]);
    
    NSLog(@"정육면체 부피 %ld", [shapeCalculator cubeVolumeSide:8]);
    
    NSLog(@"직육면체 부피 %ld", [shapeCalculator rectangularSolidVolumeHeight:6 width:8 length:4]);
    
    NSLog(@"원기둥 부피 %lf", [shapeCalculator circularCylinderVolumeHeight:8 radius:4]);
    
    NSLog(@"구 부피 %lf", [shapeCalculator sphereVolumeRadius:4]);
    
    NSLog(@"원뿔 부피 %lf", [shapeCalculator coneVolumeRadius:8 height:12]);
    
    
    
    return 0;
}
