//
//  Doctor.m
//  SecondClass
//
//  Created by david on 2016. 9. 20..
//  Copyright © 2016년 david. All rights reserved.
//

#import "Doctor.h"

@implementation Doctor

- (id)operateOnFor:(id)who withEquipment:(id)what time:(id)time {
    NSLog(@"%@장비를 가지고 %@동안 %@를 수술한다", what, time, who);
    return nil;
}
- (id)diagnosisOnFor:(id)who withEquipment:(id)what time:(id)time {
    NSLog(@"%@를 진료를 하려고 하는데 %@가 없어 %@동안 진료를 못했다.", who, what, time);
    return nil;
}

@end
