//
//  MergeSort.m
//  Example1007
//
//  Created by david on 2016. 10. 7..
//  Copyright © 2016년 david. All rights reserved.
//

#import "MergeSort.h"

@implementation MergeSort

//- (NSArray *)mergeSort:(NSArray *)list {
//    //반으로 양쪽으로 나눈다
//    //나눈값을 하나씩 꺼내서 새로운 저장소에 가져다 놓는다
//    NSInteger halfCount = list.count / 2;
//    
//    NSRange leftArray = NSMakeRange(0, halfCount);
//    NSArray *unSortedLeft = [list subarrayWithRange:leftArray];
//    
//    NSRange rightArray = NSMakeRange(halfCount, list.count - halfCount);
//    NSArray *unSortedRight = [list subarrayWithRange:rightArray];
//    
//    NSMutableArray *sortedArray = [[NSMutableArray alloc] init];
//    
//    while (unSortedLeft.count != 0 || unSortedRight.count != 0)
//    {
//        
//        if () {
//            NSInteger rightValue = [unSortedRight[0] integerValue];
//            NSInteger leftValue = [unSortedLeft[0] integerValue];
//            if (<#condition#>)
//            {
//                <#statements#>
//            }
//        }
//        
//    }
//    
//    return sortedArray;
//}


//나누기
- (NSArray *)mergeSort:(NSArray *)list {
    
    //리스트의 숫자가 1 즉 배열의 index가 0이 될경우
    if (list.count < 2) {
        return list;
    }
    
    //반 쪼개기 위한 인덱스
    NSInteger centerIndex = list.count/2;
    
    //Left 나누기 range
    //left 0부터 centerIndex까지 나누기
    NSRange lRange = NSMakeRange(0, centerIndex);
    NSArray *leftList = [list subarrayWithRange:lRange];
    
    //Right 나누기 range
    //left 0부터 centerIndex까지 나누기
    NSRange rRange = NSMakeRange(centerIndex, list.count - centerIndex);
    NSArray *rightList = [list subarrayWithRange:rRange];
    
    //
    return [self mergeOfLeft:[self mergeSort:leftList] andRight:[self mergeSort:rightList]];
    
}

//합치기
- (NSArray *)mergeOfLeft:(NSArray *)lList andRight:(NSArray *)rList {
    
    //left
    NSMutableArray *leftUnSorted = [NSMutableArray arrayWithArray:lList];
    
    //right
    NSMutableArray *rightUnSorted = [NSMutableArray arrayWithArray:rList];
    
    //다시 집어넣을 Array 용량만들기 안해도 상관x
    NSMutableArray *sortedList = [NSMutableArray arrayWithCapacity:lList.count + rList.count];
    
    //하나도 없어질때까지 비교
    while (leftUnSorted.count != 0 || rightUnSorted.count != 0)
    {
        if (leftUnSorted.count == 0)
        {//오른쪽 리스트에만 값이 있을때
            [sortedList addObject:rightUnSorted[0]];
            [rightUnSorted removeObjectAtIndex:0];
             
        } else if (rightUnSorted.count == 0)
        {//왼쪽 리스트에만 값이 있을때
            [sortedList addObject:leftUnSorted[0]];
            [leftUnSorted removeObjectAtIndex:0];
        } else
        {//아직 두 리스트에 값이 있을때
            NSInteger leftValue = [leftUnSorted[0] integerValue];
            NSInteger rightValue = [rightUnSorted[0] integerValue];
                      
            if (leftValue < rightValue)
            {//왼쪽 리스트의 값이 작은 경우
                [sortedList addObject:leftUnSorted[0]];
                [leftUnSorted removeObjectAtIndex:0];
                           
            } else if (rightValue < leftValue)
            {//오른쪽 리스트의 값이 작은 경우
                [sortedList addObject:rightUnSorted[0]];
                [rightUnSorted removeObjectAtIndex:0];
                                
            } else
            {//값이 같을경우
                [sortedList addObject:leftUnSorted[0]];
                [leftUnSorted removeObjectAtIndex:0];
                [sortedList addObject:rightUnSorted[0]];
                [rightUnSorted removeObjectAtIndex:0];
            }
        }
    }
    return sortedList;
}
@end
