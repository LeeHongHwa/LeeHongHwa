//
//  ToolBox.m
//  Example0926
//
//  Created by david on 2016. 9. 26..
//  Copyright © 2016년 david. All rights reserved.
//

#import "ToolBox.h"

@implementation ToolBox

//inch를 cm로 변환
+ (CGFloat)inchToCm:(CGFloat)inch {
    return inch * 2.54;
}

//cm를 inch로 변환
+ (CGFloat)cmToInch:(CGFloat)cm {
    return cm * 0.393701;
}

//제곱미터를 평으로 변환
+ (CGFloat)squareMetersToflat:(CGFloat)squareMeters {
    return squareMeters * 0.3025;
}
//평을 제곱미터로 변환
+ (CGFloat)flatTosquareMeters:(CGFloat)flat {
    return flat * 3.305785;
}

//화씨를 섭씨로 변환
+ (CGFloat)fahrenheitToCelsius:(CGFloat)fahrenheit {
    return fahrenheit * -17.222222;
}

//섭씨를 화씨로 변환
+ (CGFloat)celsiusToFahrenheit:(CGFloat)celsius {
    return celsius * 33.8;
}

//KB를 MB로 변환
+ (CGFloat)KBToMB:(CGFloat)KB {
    return KB * 0.000977;
}

//MB를 GB로 변환
+ (CGFloat)MBToGB:(CGFloat)MB {
    return MB * 0.000977;
}

//시간을 초로 변환
+ (NSInteger)timeToSecond:(NSInteger)hour minute:(NSInteger)minute second:(NSInteger)second {
    return (hour * 3600) + (minute * 60) + second;
}

//초를 시간으로 변환
+ (NSInteger)secondToTime:(NSInteger)second {
    return second / 3600;
}

@end
