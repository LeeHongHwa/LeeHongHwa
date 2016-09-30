//
//  DLinkedList.h
//  Example0928
//
//  Created by david on 2016. 9. 28..
//  Copyright © 2016년 david. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"
/**
 * 이중연결구조의 기능 클래스
 * @author 이홍화
 * @version 0.1
 **/
@interface DLinkedList : NSObject

///노드의 헤더를 가르킴
@property Node *header;

///마지막 인덱스
@property NSInteger lastIndex;

/**
 * 헤더의 마지막 부분에 데이터를 저장
 * @author 이홍화
 * @version 0.1
 * @param value 입력할 값
 **/
- (void)addLastValue:(NSInteger)value;

/**
 * 헤더의 다음 부분에 데이터를 저장
 * @author 이홍화
 * @version 0.1
 * @param value 입력할 값
 **/
- (void)addFirstIndexNode:(NSInteger)value;

/**
 * 마지막 노드 삭제
 * @author 이홍화
 * @version 0.1
 **/
- (void)printAllNode;


/**
 * 마지막 노드 삭제
 * @author 이홍화
 * @version 0.1
 **/
- (void)removeLast;
@end
