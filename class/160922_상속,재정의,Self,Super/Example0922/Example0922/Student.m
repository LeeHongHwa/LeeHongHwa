//
//  Student.m
//  Example0922
//
//  Created by david on 2016. 9. 22..
//  Copyright © 2016년 david. All rights reserved.
//

#import "Student.h"

@implementation Student

- (id)eatFood:(NSString *)food {
    NSLog(@"오늘 메뉴 %@ 급식을 먹는다",food);
    return nil;
}

- (id)study:(NSString *)subject {
    NSLog(@"%@는 %@과목을 공부합니다", self.personName, subject);
    return nil;
}

@end
