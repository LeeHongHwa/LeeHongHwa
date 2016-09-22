//
//  Student.h
//  Example0922
//
//  Created by david on 2016. 9. 22..
//  Copyright © 2016년 david. All rights reserved.
//

#import "Person.h"

/**
 * 사람 클래스를 상속받는 학생 클래스
 * @author 이홍화
 * @version 0.1
 */
@interface Student : Person

@property NSInteger grade;

/**
 * override
 * 급식을 먹는 메서드
 * @author 이홍화
 * @version 0.1
 * @param food 급식종류
 */
- (id)eatFood:(NSString *)food;

/**
 * 공부를 하는 메서드
 * @author 이홍화
 * @version 0.1
 * @param subject 과목종류
 */
- (id)study:(NSString *)subject;

@end
