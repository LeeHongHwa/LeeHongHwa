//
//  Healer.h
//  FirstClass
//
//  Created by david on 2016. 9. 19..
//  Copyright © 2016년 david. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Healer : NSObject

@property id magicPoint;
@property id weapon;
@property id runSpeed;
@property id woman;


- (id)heal;
- (id)addSpeed;
- (id)addPower;
- (id)addArmor;

@end
