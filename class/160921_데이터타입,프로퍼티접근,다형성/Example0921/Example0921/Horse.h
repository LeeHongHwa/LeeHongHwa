//
//  Horse.h
//  Example0921
//
//  Created by david on 2016. 9. 21..
//  Copyright © 2016년 david. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * 말 이름,울음소리 클래스
 * @author 이홍화
 * @version 0.1
 */
@interface Horse : NSObject

///말의 울음소리
@property NSString *cryingSound;

///말의 이름
@property NSString *name;

/**
 * 말이 cryingSound의 값으로 운다
 * @author 이홍화
 * @version 0.1
 */
- (id)cry;

@end
