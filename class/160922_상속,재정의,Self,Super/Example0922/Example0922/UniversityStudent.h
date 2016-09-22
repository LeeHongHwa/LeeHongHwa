//
//  UniversityStudent.h
//  Example0922
//
//  Created by david on 2016. 9. 22..
//  Copyright © 2016년 david. All rights reserved.
//

#import "Student.h"

/**
 * 학생 클래스를 상속받는 대학생 클래스
 * @author 이홍화
 * @version 0.1
 */
@interface UniversityStudent : Student

@property NSString *major;

/**
 * override
 * 학식을 먹는 메서드
 * @author 이홍화
 * @version 0.1
 * @param food 학식종류
 */
- (id)eatFood:(NSString *)food;

/**
 * 파라미터(location)로 mt를 가는 메서드
 * @author 이홍화
 * @version 0.1
 * @param location mt를 가는 장소
 */
- (id)goMTTo:(NSString *)location;

@end
