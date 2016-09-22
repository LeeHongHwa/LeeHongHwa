//
//  Teacher.m
//  Example0922
//
//  Created by david on 2016. 9. 22..
//  Copyright © 2016년 david. All rights reserved.
//

#import "Teacher.h"

@implementation Teacher

- (id)teach:(Student *)someone {
    
    NSLog(@"선생 %@가 학생 %@에게 %@과목을 가르칩니다.", self.personName, someone.personName, self.subject);
    
    return nil;
}

@end
