//
//  main.m
//  Example0926
//
//  Created by david on 2016. 9. 26..
//  Copyright © 2016년 david. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DimensionalShapes.h"
#import "CalculationSubject.h"
#import "ToolBox.h"

int main(int argc, const char * argv[]) {

    //객체 생성
    CalculationSubject *calculator = [[CalculationSubject alloc] init];
    
    //인티저일때만 나머지가 있다.
    //점수 추가
    [calculator addScore:80];
    [calculator addScore:70];
    [calculator addScore:90];
    [calculator addScore:100];
    CGFloat average = [calculator average];
    
    NSLog(@"점수의 평균은 %5.2lf 입니다", average);

    
    //도형의 넓이,둘레,부피
    NSLog(@"정사각형 넓이 %ld", [DimensionalShapes squareAreaSide:5]);
    NSLog(@"정사각형 둘레 %ld", [DimensionalShapes squarePerimeterSide:5]);
    NSLog(@"직사각형 넓이 %ld", [DimensionalShapes rectangleAreaHeight:5 width:8]);
    NSLog(@"직사각형 둘레 %ld", [DimensionalShapes rectanglePerimeterHeight:5 width:8]);
    NSLog(@"원 넓이 %lf", [DimensionalShapes circleAreaRadius:8]);
    NSLog(@"원 둘레 %lf", [DimensionalShapes circleCircumferenceRadius:8]);
    NSLog(@"삼각형 넓이 %lf", [DimensionalShapes triangleAreaHeight:12 side:8]);
    NSLog(@"사다리꼴 넓이 %lf", [DimensionalShapes trapezoidAreaHeight:12 upSide:4 downSide:8]);
    NSLog(@"정육면체 부피 %ld", [DimensionalShapes cubeVolumeSide:8]);
    NSLog(@"직육면체 부피 %ld", [DimensionalShapes rectangularSolidVolumeHeight:6 width:8 length:4]);
    NSLog(@"원기둥 부피 %lf", [DimensionalShapes circularCylinderVolumeHeight:8 radius:4]);
    NSLog(@"구 부피 %lf", [DimensionalShapes sphereVolumeRadius:4]);
    NSLog(@"원뿔 부피 %lf", [DimensionalShapes coneVolumeRadius:8 height:12]);
    
    //인치,cm,평,제곱미터,화씨,섭씨,메가바이트,기가바이트,키로바이트,시간,초
    NSLog(@"인치를 센치로 변환 %lf",[ToolBox inchToCm:58]);
    NSLog(@"센치를 인치로 변환 %lf",[ToolBox cmToInch:53]);
    NSLog(@"제곱미터를 평으로 변환 %lf",[ToolBox squareMetersToflat:82]);
    NSLog(@"평을 제곱미터로 변환 %lf",[ToolBox flatTosquareMeters:56]);
    NSLog(@"화씨를 섭씨로 변환 %lf",[ToolBox fahrenheitToCelsius:34]);
    NSLog(@"섭씨를 화씨로 변환 %lf",[ToolBox celsiusToFahrenheit:24]);
    NSLog(@"KB를 MB로 변환 %lf",[ToolBox KBToMB:1000]);
    NSLog(@"MB를 KM로 변환 %lf",[ToolBox MBToGB:2223]);
    NSLog(@"초를 시간으로 변환 %ld",[ToolBox secondToTime:60000]);
    NSLog(@"시간을 초로 변환 %ld",[ToolBox timeToSecond:70 minute:100 second:5000]);
    
    //달의 마지막날
    [CalculationSubject lastDayOfMonth:5];
    
    //절대값
    NSLog(@"%lf", [CalculationSubject roundNum:5.378]);
    
    //윤년
    [CalculationSubject checkLeapYear:100];
    
    //NSString 비교
    NSString *myString1 = @"foo";
    NSString *myString2 = @"foo";
    [myString1 isEqualToString:myString2];
    
    return 0;
}
