//
//  Student.m
//  Example0923
//
//  Created by david on 2016. 9. 23..
//  Copyright © 2016년 david. All rights reserved.
//

#import "Student.h"

@implementation Student

//이름, 도시, 학교, 성적 초기화
- (instancetype)initWithName:(NSString *)name
                        city:(NSString *)city
                  schoolName:(NSString *)school
                       grade:(NSInteger)grade {
    
    self = [super initWithName:name
                          city:city];
    
    self.school = school;
    self.grade = grade;
    
    return self;
}

//이름, 도시. 학교, 학년, 성적 초기화
- (instancetype)initWithName:(NSString *)name
                        city:(NSString *)city
                  schoolName:(NSString *)school
                       grade:(NSInteger)grade
                      credit:(NSInteger)credit {
    
    self = [self initWithName:name
                         city:city
                   schoolName:school
                        grade:grade];

    self.credit = credit;
    
    return self;
}

@end
