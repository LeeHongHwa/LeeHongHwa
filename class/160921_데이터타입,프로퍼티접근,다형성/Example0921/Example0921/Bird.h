//
//  Bird.h
//  Example0921
//
//  Created by david on 2016. 9. 21..
//  Copyright © 2016년 david. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * 새 이름,울음소리 클래스
 * @author 이홍화
 * @version 0.1
 */
@interface Bird : NSObject

///새의 울음소리
@property NSString *cryingSound;

///새의 이름
@property NSString *name;

/**
 * 새가 cryingSound의 값으로 운다
 * @author 이홍화
 * @version 0.1
 */
- (id)cry;
@end
