//
//  InsertSort.m
//  Example1007
//
//  Created by david on 2016. 10. 7..
//  Copyright © 2016년 david. All rights reserved.
//

#import "InsertSort.h"

@implementation InsertSort

- (NSArray *)insertSort:(NSArray *)array
{   //수정이 자유롭게 NSMutableArray로 변경
    NSMutableArray *insertArray = [[NSMutableArray alloc] initWithArray:array];
    
    //비교할 index
    for (NSInteger i = 1; i < insertArray.count; i += 1)
    {
        //지금 value
        NSInteger nowValue = [insertArray[i] integerValue];
        //이전 value
        NSInteger preValue = [insertArray[i - 1] integerValue];
        
        //preValue가 nowValue보다 더 크다면 (다른 말로 하면 정렬이 안되어 있다면)
        if (nowValue < preValue)
        {
            //while에서 사용할 변수 초기화
            NSInteger preIndex = 1, j = 1;
            
            //nowValue가 preValue보다 크고 preIndex 0이될경우
            while (nowValue < preValue  && 0 < preIndex)
            {
                //preValue의 index값
                preIndex = i - j;
                
                //nowValue에서 거꾸로 하나씩 preValue생성
                preValue = [insertArray[preIndex] integerValue];
                
                //preIndex의 숫자를 하나씩 감소시키기 위한 변수
                j += 1;
            }
            //nowValue의 index값을 지우고
            [insertArray removeObjectAtIndex:i];
            
            //nowValue가 배열에 가장 작은 값일 경우
            if (nowValue < preValue && preIndex == 0)
            {
                [insertArray insertObject:@(nowValue) atIndex:preIndex];
            
            //그게 아니라면 그뒤에 집어넣어라
            }else
            {
                [insertArray insertObject:@(nowValue) atIndex:preIndex + 1];
            }
        }
    }
return insertArray;
}

@end
