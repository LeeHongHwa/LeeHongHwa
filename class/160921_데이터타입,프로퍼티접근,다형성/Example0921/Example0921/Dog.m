//
//  Dog.m
//  Example0921
//
//  Created by david on 2016. 9. 21..
//  Copyright © 2016년 david. All rights reserved.
//

#import "Dog.h"

@implementation Dog

///객체의 프로퍼티(name, cryingSound)를 받아 출력한다
-(id)cry {
    NSLog(@"\n%@가 %@ 운다",self.name ,self.cryingSound);
    return nil;
}

@end
