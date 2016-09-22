//
//  Doctor.h
//  SecondClass
//
//  Created by david on 2016. 9. 20..
//  Copyright © 2016년 david. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 * 의사 클래스
 * @autour 이홍화
 * @verison 0.1
 */
@interface Doctor : NSObject

/// 의사의 옷
@property id cloth;

/// 의사의 키
@property id height;

/// 의사의 몸무게
@property id weight;

/// 의사의 나이
@property id age;


/// 의사의 성별
@property id sex;

/**
 * 사람에게 어떠한 장비를 가지고 얼마동안 수술한다
 * @autour 이홍화
 * @verison 0.1
 * @param who 수술 받는 사람
 * @param what 수술 장비
 * @param time 수술 시간
 */
- (id)operateOnFor:(id)who withEquipment:(id)what time:(id)time;

/**
 * 사람에게 어떠한 장비를 가지고 얼마동안 진료한다.
 * @autour 이홍화
 * @verison 0.1
 * @param who 진료 받는 사람
 * @param what 진료 장비
 * @param time 진료 시간
 */
- (id)diagnosisOnFor:(id)who withEquipment:(id)what time:(id)time;

@end
