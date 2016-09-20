//
//  Doctor.h
//  SecondClass
//
//  Created by david on 2016. 9. 20..
//  Copyright © 2016년 david. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Doctor : NSObject

@property id cloth;
@property id height;
@property id weight;
@property id age;
@property id sex;

- (id)operateOnFor:(id)who withEquipment:(id)what time:(id)time;
- (id)diagnosisOnFor:(id)who withEquipment:(id)what time:(id)time;

@end
