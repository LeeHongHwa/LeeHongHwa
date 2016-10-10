//
//  QuickSort.m
//  Example1007
//
//  Created by david on 2016. 10. 7..
//  Copyright © 2016년 david. All rights reserved.
//

#import "QuickSort.h"

@implementation QuickSort

//퀵 정렬
- (NSArray *)quickSort:(NSArray *)unSortedList
{
    //NSMutableArray변수 선언
    NSMutableArray *unSortedMutable = [[NSMutableArray alloc] initWithArray:unSortedList];
    
    //pivotValue보다 작은 값 넣을 NSMutableArray
    NSMutableArray *lessArray = [[NSMutableArray alloc] init];
    
    //pivotValue보다 큰 값 넣을 NSMutableArray
    NSMutableArray *greaterArray = [[NSMutableArray alloc] init];
    
    //만약에 값이 없을경우 nil값 return
    if ([unSortedList count] < 1)
    {
        return nil;
    }
    
    //계속해서 나눠라
    NSNumber *pivotValue = unSortedMutable[0];
    [unSortedMutable removeObjectAtIndex:0];
    
    
    
    //Divide
    for (NSNumber *num in unSortedMutable)
    {
        if (num < pivotValue)
        {
            [lessArray addObject:num];
        }else
        {
            [greaterArray addObject:num];
        }
    }
    
    //병합
    NSMutableArray *sortedArray = [[NSMutableArray alloc] init];
    [sortedArray addObjectsFromArray:[self quickSort:lessArray]];
    [sortedArray addObject:pivotValue];
    [sortedArray addObjectsFromArray:[self quickSort:greaterArray]];

    
    return sortedArray;
}

@end
