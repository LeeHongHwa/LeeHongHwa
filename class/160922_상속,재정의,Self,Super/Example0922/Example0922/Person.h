//
//  Person.h
//  Example0922
//
//  Created by david on 2016. 9. 22..
//  Copyright © 2016년 david. All rights reserved.
//

#import "Animal.h"

/**
 * 사람 클래스
 * 이름과 나이를 가질 수 있는 특징이 있다
 * 먹고 동물을 입양할 수 있는 메소드를 가지고 있다
 * @author 이홍화
 * @version 0.1
 */
@interface Person : Animal

///이름
@property NSString *personName;

///나이
@property NSInteger age;

/**
 * 집밥을 먹는 메서드
 * @author 이홍화
 * @version 0.1
 * @param food 집밥종류
 */
- (id)eatFood:(NSString *)food;

/**
 * 동물을 입양하는 메서드
 * @author 이홍화
 * @version 0.1
 * @param animalName 동물이름
 */
- (id)adopt:(Animal *)animalName;

@end
