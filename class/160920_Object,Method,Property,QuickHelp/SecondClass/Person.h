//
//  Person.h
//  SecondClass
//
//  Created by david on 2016. 9. 20..
//  Copyright © 2016년 david. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * 사람을 만드는 클래스
 * 이름을 가지고 있습니다.
 * 달릴수 있고 전화할 수 있습니다.
 * @discussion 사람이 가질수 있는 property와 method는 뭐가 있을까?
 * @author 이홍화
 * @version 0.1
 */

@interface Person : NSObject

/// 사람의 이름 프로퍼티 입니다
@property id name;

/**
 * where(장소)를 달립니다
 * @param where run이 달릴 장소
 * @return 반환값은 나중에 배웁니다
 * @author 이홍화
 * @version 0.1
 */
- (id)run:(id)where;

/**
 * where(장소)를 speed(속도)로 someone(같이 가는 사람)과 달립니다
 * @param where run(달리기)이 달릴 장소
 * @param speed run(달리기)이 가는 속도
 * @param someone 같이 run(달리기) 하는 사람
 * @author 이홍화
 * @version 0.1
 */
- (id)runTo:(id)where bySpeed:(id)speed with:(id)someone;

/**
 * who(누구)에게 전화합니다.
 * @param who call(전화) 할 사람
 * @author 이홍화
 * @version 0.1
 */
- (id)call:(id)who;

@end
