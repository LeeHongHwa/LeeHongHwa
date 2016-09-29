//
//  Person.m
//  Example0927
//
//  Created by david on 2016. 9. 27..
//  Copyright © 2016년 david. All rights reserved.
//

#import "Person.h"

@implementation Person

//name값으로 초기화하는 override
- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        self.name = name;
    }
    return 0;
}

- (void)setHeight:(CGFloat)height weight:(CGFloat)weight {
    
    // _info.height = height; 변수.구조체 _이건 변수 그리고 세터 게터
    // _info.weight = weight;// 변수에 값넣기
    
    /*-----------------------------이것이 안되는 이유-----------------------------
     
     self.info.height = height;
     self.info.weight = weight;
     
     이건 self.info가 게터메서드 그리고 나서 세터 메서드가 되는것으로 인식한다.
     
     그러므로 구조체의.과는 다르다.
     변수.구조체에 들어있는 변수명
     
     프로퍼티 생성시
     NSString _a;
    
     겟터메서드
     -(NSString)a{
     return _a;
     }
     
     셋터메서드
     -(void)setA:(NSString)newA{
     _a= newA;
     }
     */
    //구조체 초기화는 순서대로 집어넣어 진다.
    character tempInfo = {height, weight};
    
    //setter method 호출
    self.info = tempInfo; // = [self setInfo:tempInfo];
}

//구조체 게터 메서드
- (character)personInfo {
    return self.info; // 게터
}




@end
