//
//  Wizzard.m
//  Example0922
//
//  Created by david on 2016. 9. 22..
//  Copyright © 2016년 david. All rights reserved.
//

#import "Wizzard.h"

@implementation Wizzard

- (id)magiccalAttactTo:(GameCharacter *)someone {
    NSLog(@"%@가 %@에게 스매시 공격을 합니다", self.name, someone.name);
    return nil;
}

- (id)teleportTo:(NSString *)location {
    NSLog(@"%@가 %@로 점프를 합니다", self.name, location);
    return nil;
}

@end
