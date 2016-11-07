//
//  Person.m
//  PropertyExample1107
//
//  Created by david on 2016. 11. 7..
//  Copyright © 2016년 david. All rights reserved.
//

#import "Person.h"

@implementation Person

- (NSString *)personName
{
    return _personName;
}

- (NSInteger)age
{
    return _age;
}

- (CGFloat)weight
{
    return _weight;
}


- (void)setPersonName:(NSString *)personName
{
    _personName = personName;
}

- (void)setAge:(NSInteger)age
{
    _age = age;
}

- (void)setWeight:(CGFloat)weight
{
    _weight = weight;
}

- (void)prinfPersonInfo
{
    NSLog(@"이름 : %@, 나이 : %ld, 몸무게 : %lf", _personName, _age, _weight);
}

@end
