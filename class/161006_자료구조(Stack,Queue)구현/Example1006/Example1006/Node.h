//
//  Node.h
//  Example1006
//
//  Created by david on 2016. 10. 6..
//  Copyright © 2016년 david. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
    단일 연결리스트를 이용한 stack구조 Node
    @author 이홍화
    @version 0.1
*/
@interface Node : NSObject

//다음 주소
@property Node *next;

///값
@property NSString *value;

@end
