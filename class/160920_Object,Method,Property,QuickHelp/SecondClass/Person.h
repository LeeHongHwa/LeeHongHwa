//
//  Person.h
//  SecondClass
//
//  Created by david on 2016. 9. 20..
//  Copyright © 2016년 david. All rights reserved.
//

#import <Foundation/Foundation.h>

//여러줄 퀵헬프

/**
 * @description 사람을 나타내는 클래스입니다.
 * @author 이홍화
 * @version 0.1
 */

@interface Person : NSObject

// 이름을 정의합니다. 한줄 퀵헬프
/// 사람의 이름 프로퍼티 입니다
@property id name;

/**
 * @description where(장소)를 달립니다
 * @param where 장소
 * @author 이홍화
 * @version 0.1
 */
- (id)run:(id)where;

/**
 * @description where(장소)를 speed(속도)로 someone(같이 가는 사람) 달립니다
 * @param where 장소
 * @param speed 속도
 * @param someone 같이 가는 사람
 * @author 이홍화
 * @version 0.1
 */
- (id)runTo:(id)where bySpeed:(id)speed with:(id)someone;

/**
 * @description who(누구)에게 전화합니다.
 * @param who 전화
 * @author 이홍화
 * @version 0.1
 */
- (id)call:(id)who;

@end
