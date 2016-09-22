//
//  Teacher.h
//  Example0922
//
//  Created by david on 2016. 9. 22..
//  Copyright © 2016년 david. All rights reserved.
//

#import "Student.h"

/**
 * 학생 클래스를 상속받는 선생님 클래스
 * @author 이홍화
 * @version 0.1
 */
@interface Teacher : Person

/// 월급
@property NSInteger salary;

/// 과목
@property NSString *subject;

/**
 * 파라미터(someone)를 가르치는 메서드
 * @author 이홍화
 * @version 0.1
 * @param someone 학생
 */
- (id)teach:(Student *)someone;

@end
