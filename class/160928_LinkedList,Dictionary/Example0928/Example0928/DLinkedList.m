//
//  DLinkedList.m
//  Example0928
//
//  Created by david on 2016. 9. 28..
//  Copyright © 2016년 david. All rights reserved.
//

#import "DLinkedList.h"

@implementation DLinkedList

//------------------------------초기화---------------------------------
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.header = [[Node alloc] init];
        self.header.next = nil;
        
// [[self setHeader:(Node *)newHeader] setPrevious:nil]
        
        
        self.header.previous = nil;
        self.lastIndex = 0;
    }
    return self;
}


//---------------------리스트의 마지막에 노드를 추가하는 방법-------------------------

//반환값이 없고 value매개변수 입력
- (void)addLastValue:(NSInteger)value {
    //수신자야 addLastIndexNode메서드를 실행하고 매개변수 값은 self.header, value
    [self addLastIndexNode:self.header newValue:value];
}

- (void)addLastIndexNode:(Node *)nowNode newValue:(NSInteger)value
{
    //nowNode의 next가 nil이냐?
    //참
    if (nowNode.next == nil) {
        
        //노드를 하나 만들고
        Node *newNode = [[Node alloc] init];
        
        //newNode에 value값 저장
        newNode.value = value;
        
        //지금의 헤더주소를 newNode.prvious에 저장
        newNode.previous = nowNode;
        
        /*
         위에서 init override를 통해 이미 next는 nil값이 들어오는거 아닐까 ?
         
         아니다 Node 클래스니깐 override한부분은 DLinkedList이므로 적용이 안되고
         NSObject의 init메서드를 사용한 것이다.
        */
        //노드의 다음주소를 nil 값으로 초기화
        newNode.next = nil;
        
        //노드의 인덱스는 마지막 인덱스이다.
        newNode.index = self.lastIndex;
        
        //새로운 노드의 주소를 기존 노드의 next @Property에 저장
        nowNode.next = newNode;
        
        //수신자의 lastIndex에 + 1을 한다.
        self.lastIndex = self.lastIndex + 1;
        
    }else {
        
        //nil이 아닐경우에 실행
        [self addLastIndexNode:nowNode.next newValue:value];
    }
    
}

//---------------------헤드 다음에 노드를 추가하는 방법-------------------------

- (void)addFirstIndexNode:(NSInteger)value {
    
    //새로운 노드 생성
    Node *newNode = [[Node alloc] init];
    
    //새로운 노드에 값 저장
    newNode.value = value;
    
    //수신자의 header에 next 값이 nil일 경우
    if (self.header.next == nil) {
        
        //newNode의 주소값을  헤더의 다음값에 저장
        self.header.next = newNode;
        
        //newNode의 이전값에 헤더 주소값 저장
        newNode.previous = self.header;
        
        //newNode의 다음값에 nil 다음이 없다
        newNode.next = nil;
        
        //이미 헤더 다음에 값이 있을경우 일명 끼어들기
    } else {
        
        //새로운 Node객체의 이전값에 헤더의 주소 값을 넣는다
        newNode.previous = self.header;
        
        //새로운 Node객체의 다음값에 헤더의 다음값을 넣는다
        newNode.next = self.header.next;
        
        //기존에 있는 헤더 다음값의 이전값에는 새로운 Node의 주소를 넣는다
        self.header.next.previous = newNode;
        
        //헤더의 다음 값에 새로운 Node 주소값을 넣는다
        self.header.next = newNode;
    }
    
}

//마지막 정보를 제거한다
- (void)removeLast
{
    [self removeLastNode:self.header];
}

//removeLast
- (void)removeLastNode:(Node *)nowNode; {
    
    //nowNode의 다음값이 없을경우
    if (nowNode.next == nil) {
        
        //nowNode의 이전값의 다음값을 nil
        nowNode.previous.next = nil;
        
        //nowNode의 이전값을 nil
        nowNode.previous = nil;
        
        //nowNode의 다음값이 있는경우 .next를 해서 계속해서 마지막 Node부분을 찾는다
    } else {
        [self removeLastNode:nowNode.next];
    }
    
}

//printNode(다음 노드가 없을때 까지 출력)
- (void)printAllNode {
    
    [self printNode:self.header];
    //if(self.header.next != nil) {}[self.prinr]
    
}


- (void)printNode:(Node *)node {
    
    //노드의 다음값이 있다면
    if (node.next != nil) {
        
        //노드의 값을 출력
        NSLog(@"%ld",node.value);
        
        //다음 노드를 불러온다
        [self printNode:node.next];
        
    } else {
        
        //노드의 값이 없다면
        NSLog(@"%ld",node.value);
    }
}


/*

--------------------------- . 에 관하여 -----------------------------------
 
self.header.preve.next = [node alloc] init];

Node *headerNode = [self header]; self.header
Node *preNode = [headerNode preve]; (self.header).preve
Node *nextNode = [preNode next]; ((self.header).preve).next
nextNode = [[Node alloc] init]; (((self.header).preve).next) = 객체

[[[self header] preve] setNext]:[[node alloc] init]];
*/


@end
