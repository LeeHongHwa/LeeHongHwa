//
//  Stack.h
//  Example1006
//
//  Created by david on 2016. 10. 6..
//  Copyright © 2016년 david. All rights reserved.
//

#import "Node.h"
/**
    Node를 상속
    Stack구조
    @author 이홍화
    @version 0.1
*/
@interface Stack : Node

@property Node *header;

///값추가
- (void)push:(NSString *)value;

///값출력후 삭제
- (NSString *)pop;

///stack이 비어있는지 여부
- (BOOL)isEmpty;

///괄호검사
- (BOOL)checkBracketString:(NSString *)string;

@end
