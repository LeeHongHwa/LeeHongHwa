//
//  Warrior.m
//  SecondClass
//
//  Created by david on 2016. 9. 20..
//  Copyright © 2016년 david. All rights reserved.
//

#import "Warrior.h"

@implementation Warrior

- (id)sturn:(id)monster {
    NSLog(@"%@에게 30%% 확률로 기절", monster);
    return nil;
}
- (id)attack:(id)human {
    NSLog(@"%@150%% 증가된 데미지", human);
    return nil;
}
- (id)attackTo:(id)monster hit:(id)number with:(id)who {
    NSLog(@"%@을 %@번 %@과 같이 때리다", monster ,number, who);
    return nil;
}
- (id)berserker {
    NSLog(@"방어력 무시");
    return nil;
}
- (id)run {
    NSLog(@"이동속도 증가 체력 %@ 증가", self.health);
    return nil;
}
@end
