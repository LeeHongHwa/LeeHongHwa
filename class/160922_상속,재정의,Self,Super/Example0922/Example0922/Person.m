//
//  Person.m
//  Example0922
//
//  Created by david on 2016. 9. 22..
//  Copyright © 2016년 david. All rights reserved.
//

#import "Person.h"

@implementation Person

- (id)adopt:(Animal *)animalName {
    NSLog(@"%@가 동물이름 %@를 입양했습니다.",self.personName, animalName.name);
    return nil;
}

- (id)eatFood:(NSString *)food {
    NSLog(@"오늘 메뉴 %@ 집밥을 먹는다",food);
    return nil;
}

@end
