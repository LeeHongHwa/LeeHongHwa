//
//  BubbleSort.m
//  Example1007
//
//  Created by david on 2016. 10. 7..
//  Copyright © 2016년 david. All rights reserved.
//

#import "BubbleSort.h"

@implementation BubbleSort

- (NSArray *)bubbleSortWithArray:(NSArray *)array
{
    
    //임시 저장
    NSMutableArray *tempArray = [[NSMutableArray alloc] initWithArray:array];
    
    //전체를 반복
    for (NSInteger i = 1; i < tempArray.count; i += 1)
    {
        //마지막에 제일 큰 값이 정렬되기 때문에 count - i를 한다
        for (NSInteger j = 0; j < tempArray.count - i; j += 1)
        {
            //지금 값
            NSInteger tempNow = [tempArray[j] integerValue];
            
            //새로운 값
            NSInteger tempNew = [tempArray[j+1] integerValue];
        
            //새로운 값이 크다면
            if (tempNew < tempNow)
            {
                //지금 값과 새로운 값을 바꿔라
                [tempArray exchangeObjectAtIndex:j withObjectAtIndex:j+1];
            }
        }
    }
    return tempArray;
}

@end
