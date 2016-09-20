//
//  Wizard.h
//  SecondClass
//
//  Created by david on 2016. 9. 20..
//  Copyright © 2016년 david. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 위자드 클래스
 이름, 건강, 체력, 마법력, 무기를 가진 클래스를 생성합니다.
 */
@interface Wizard : NSObject

@property id name;
@property id mana;
@property id health;
@property id physicalPower;
@property id magicalPower;
@property id weapon;

- (id)fire;
- (id)fireTo:(id)human;
- (id)thunder;
- (id)cold;
- (id)wind;

- (id)windstorm:(id)to;
- (id)magicalAttack:(id)to;
- (id)heal:(id)to;

@end
