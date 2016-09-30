//
//  main.m
//  Example0928
//
//  Created by david on 2016. 9. 28..
//  Copyright © 2016년 david. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"
#import "DLinkedList.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//------------------------------------이중 연결 리스트-------------------------------------
        
        //헤더 생성
        DLinkedList *DLnodeTest = [[DLinkedList alloc] init];
        
        //마지막 노드에 값저장
        [DLnodeTest addLastValue:5];
        [DLnodeTest addLastValue:9];
        
        //헤더 다음부분에 값저장
        [DLnodeTest addFirstIndexNode:100];
        
        //마지막 노드에 값저장
        [DLnodeTest addLastValue:15];
        [DLnodeTest addLastValue:25];
        [DLnodeTest addLastValue:72];
        
        //모든 노드 프린트
        [DLnodeTest printAllNode];
        
        //마지막 노드 제거
        [DLnodeTest removeLast];
        
        //모든 노드 프린트
        [DLnodeTest printAllNode];
        
    }
    return 0;
}
