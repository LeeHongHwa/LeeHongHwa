//
//  SelectionSort.m
//  Example1007
//
//  Created by david on 2016. 10. 7..
//  Copyright © 2016년 david. All rights reserved.
//

#import "SelectionSort.h"

@implementation SelectionSort

//----------------------------------- 내 코드 ---------------------------------------

- (NSArray *)sort:(NSArray *)list
{
    /*
     NSArray로 데이터타입을 지정하는 이유:
     데이터를 주고 받을때 상대방이 NSMutableArray가 아닐 수도 있기 때문이다.
     */
    
    //리스트 임시 저장
    NSMutableArray *tempList = [[NSMutableArray alloc] initWithArray:list];
    
    //작은값의 index 초기화
    NSInteger compareIndex = 0;
    
    //배열의 0번째 자리에 가장작은 값이 오게 끔 만든다
    for (NSInteger i = 0; i < tempList.count; i += 1)
    {
        NSInteger nowValue = [tempList[i] integerValue];
        
        for (NSInteger j = i; j < tempList.count; j += 1)
        {
            NSInteger compareValue = [tempList[j] integerValue];
            
            if (compareValue < nowValue)
            {
                nowValue = compareValue;
                compareIndex = j;
            }
        }
        //배열의 맨 마지막은 비교할것이 없기 때문에 조건을 걸어준다
        if (compareIndex < tempList.count)
        {
            [tempList exchangeObjectAtIndex:i withObjectAtIndex:compareIndex];
        }
    }
    return tempList;
}


//--------------------------------------- 강사님 코드 ---------------------------------------------

//- (NSArray *)sort:(NSArray *)list
//{
//    
//    NSMutableArray *unSortedList = [[NSMutableArray alloc] initWithArray:list];
//
//    
//    //리스트의 시작부터 끝까지 확인
//    for (NSInteger i = 0; i < unSortedList.count; i += 1) {
//        
//        //최소값 구하기
//        NSInteger minValue = [unSortedList[i] integerValue];
//        NSInteger minIndex = i;
//        
//        //i 다음번째 의 숫자중 가장 작은수를 찾아내기
//        for (NSInteger j = i; j < unSortedList.count; j += 1) {
//            NSInteger compareValue = [unSortedList[j] integerValue];
//
//            if (minValue > compareValue) {
//                minValue = compareValue;
//                minIndex = j;
//            }
//            
//        }
//        //리스트의 데이터 교환
//        //i번째는 minIndex로, minIndex는 i번쨰로
//        if (i != minIndex) {
//            [unSortedList exchangeObjectAtIndex:i withObjectAtIndex:minIndex];
//            
//        }
//    }
//        
//        return unSortedList;
//}

@end
