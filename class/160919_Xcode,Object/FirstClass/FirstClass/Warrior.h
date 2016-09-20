//
//  Warrior.h
//  FirstClass
//
//  Created by david on 2016. 9. 19..
//  Copyright © 2016년 david. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 워리어 클래스는 카카오 게임에서 바바리안 캐릭터를 생성하는 클래스 입니다.
 
*/

@interface Warrior : NSObject

//워리어 속성

//워리어가 사용할 수 있는 무기입니다.
@property id weapon;

//strength가 1씩 증가할 때마다 공격력이 15씩 증가한다.
@property id strength;

//constitution가 1씩 증가할 때마다 체력이 15씩 증가한다.
@property id constitution;

//체력 최대 5000HP
@property id healthPoint;

//워리어 메소드

//적에게 150% 데미지를 입힌다.
- (id)bash;

//적에게 120% 데미지를 입히고, 30% 확률로 기절한다.
- (id)stun;

//3칸 점프를 해서 근처에 있는 적에게 80% 데미지를 입힌다.
- (id)leapAttack;

//근처에 있는 적에게 110% 데미지를 입히고, 15초 동안 지속된다.
- (id)whirlWind;

//자신의 방어력이 70%로 감소되며, 공격력이 300%로 증가 됩니다.
- (id)berserk;

@end
