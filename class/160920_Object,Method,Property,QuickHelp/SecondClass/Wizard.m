//
//  Wizard.m
//  SecondClass
//
//  Created by david on 2016. 9. 20..
//  Copyright © 2016년 david. All rights reserved.
//

#import "Wizard.h"

@implementation Wizard

- (id)fire {
    NSLog(@"화염");
    return nil;
}
- (id)fireTo:(id)human {
    NSLog(@"%@에게 화염을 발사합니다.", human);
    return nil;
}
- (id)thunder {
    NSLog(@"번개");
    return nil;
}
- (id)cold {
    NSLog(@"얼음");
    return nil;
}
- (id)wind {
    NSLog(@"바람");
    return nil;
}

- (id)windstorm:(id)to {
    NSLog(@"%@님이 %@에게 바람과 번개공격!!", self.name, to);
    return nil;
}
- (id)magicalAttack:(id)to {
    NSLog(@"%@님이 %@에게 매직 어택!!", self.name, to);
    return nil;
}
- (id)heal:(id)to {
    NSLog(@"%@님이 %@를 치료!!", self.name, to);
    //셀프는 메소드를 실행시키는 객체(주체)를 뜻하나보다
    return nil;
}
@end
