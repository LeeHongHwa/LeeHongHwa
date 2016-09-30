//
//  Node.h
//  Example0928
//
//  Created by david on 2016. 9. 28..
//  Copyright © 2016년 david. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 * 이중연결구조의 데이터 클래스
 * 값, 다음주소와, 이전주소, 인덱스값
 * @author 이홍화
 * @version 0.1
 **/
@interface Node : NSObject

///값
@property NSInteger value;

///다음 주소
@property Node *next;

///이전 주소
@property Node *previous;

///인덱스
@property NSInteger index;


@end
