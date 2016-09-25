//
//  FireWizzard.m
//  Example0923
//
//  Created by david on 2016. 9. 23..
//  Copyright © 2016년 david. All rights reserved.
//

#import "FireWizzard.h"

@implementation FireWizzard

//상대방의 공격을 막는다
- (id)fireProtctTo:(GameCharacter *)gameCharacter {
    NSLog(@"%@가 %@의 공격을 막았습니다.", self.name, gameCharacter.name);
    return nil;
}

@end
