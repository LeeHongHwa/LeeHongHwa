//
//  Student.h
//  Example0923
//
//  Created by david on 2016. 9. 23..
//  Copyright © 2016년 david. All rights reserved.
//

#import "Person.h"

/**
 * Person 클래스를 상속받은 Student 클래스
 * 다니고 있는 학교, 학년, 성적 속성이 있다.
 * author 이홍화
 * version 0.1
 */
@interface Student : Person

/// 학교
@property NSString *school;

/// 학년
@property NSInteger grade;

/// 성적
@property NSInteger credit;

/**
 * 이름, 거주지, 학교, 학년 속성값을 초기화 하는 메서드
 * @author 이홍화
 * @version 0.1
 * @param name 이름
 * @param city 도시
 * @param school 학교
 * @param grade 학년
 */
- (instancetype)initWithName:(NSString *)name city:(NSString *)city schoolName:(NSString *)school grade:(NSInteger)grade;

/**
 * 이름, 거주지, 학교, 학년, 성적 속성값을 초기화 하는 메서드
 * @author 이홍화
 * @version 0.1
 * @param name 이름
 * @param city 도시
 * @param school 학교
 * @param grade 학년
  * @param credit 성적
 */
- (instancetype)initWithName:(NSString *)name city:(NSString *)city schoolName:(NSString *)school grade:(NSInteger)grade credit:(NSInteger)credit;

@end
