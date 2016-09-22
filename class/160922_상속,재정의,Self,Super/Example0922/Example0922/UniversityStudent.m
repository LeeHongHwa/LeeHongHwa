//
//  UniversityStudent.m
//  Example0922
//
//  Created by david on 2016. 9. 22..
//  Copyright © 2016년 david. All rights reserved.
//

#import "UniversityStudent.h"

@implementation UniversityStudent

- (id)eatFood:(NSString *)food {
    NSLog(@"오늘 메뉴 %@ 학식을 먹는다",food);
    return nil;
}

- (id)goMTTo:(NSString *)location {
    NSLog(@"%@가 %@로 MT간다", self.personName, location);
    return nil;
}

@end
