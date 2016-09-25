//
//  Person.m
//  Example0923
//
//  Created by david on 2016. 9. 23..
//  Copyright © 2016년 david. All rights reserved.
//

#import "Person.h"

@implementation Person

//이름, 잘생김 초기화
- (instancetype)initWithName:(NSString *)name isHandsome:(BOOL)isHandsome {
    
    self.name = name;
    self.isHandsome = isHandsome;
    
    return self;
}

//이름, 거주지 초기화
- (instancetype)initWithName:(NSString *)name city:(NSString *)city {
    
    self.name = name;
    self.city = city;
    
    return self;
}

//나이, 거주지, 성별 초기화
- (instancetype)initWithAge:(NSInteger)age city:(NSString *)city sex:(NSString *)sex {
    
    self.age = age;
    self.city = city;
    self.sex = sex;
    
    return self;
    
}

- (id)call{
    NSLog(@"call me");
    return nil;
}

@end
