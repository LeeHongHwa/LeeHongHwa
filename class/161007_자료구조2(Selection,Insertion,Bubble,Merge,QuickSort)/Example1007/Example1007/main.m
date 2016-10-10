//
//  main.m
//  Example1007
//
//  Created by david on 2016. 10. 7..
//  Copyright © 2016년 david. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SelectionSort.h"
#import "BubbleSort.h"
#import "InsertSort.h"
#import "MergeSort.h"
#import "QuickSort.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

//----------------------------------------- SelectionSort ------------------------------------------------
//        NSArray *data = @[@1,@6,@10,@14,@5,@30,@25];
//        
//        SelectionSort *sort = [[SelectionSort alloc] init];
//        
//        NSLog(@"selectionSort : %@",[sort sort:data]);
        
//-------------------------------------------- BubbleSort ---------------------------------------------
        
        NSArray *bubbleData = @[@1,@18,@10,@14,@5,@30,@25,@12,@31,@83];
        
        BubbleSort *bubble = [[BubbleSort alloc] init];
        
        NSLog(@"bubbledata : %@",[bubble bubbleSortWithArray:bubbleData]);
        
//---------------------------------------------- InsertSort --------------------------------------------
        
//        NSArray *insertData = @[@6,@18,@10,@14,@5,@30,@25,@12,@31,@83];
//
//        InsertSort *insert = [[InsertSort alloc] init];
//
//        NSLog(@"InsertSort : %@",[insert insertSort:insertData]);

//-------------------------------------------- MergeSort ----------------------------------------------
        
        NSArray *mergeData = @[@6,@18,@10,@14,@5,@30,@25,@12,@31,@83];
        
        MergeSort *merge = [[MergeSort alloc] init];
        
        NSLog(@"InsertSort : %@",[merge mergeSort:mergeData]);
        
//-------------------------------------------- QuickSort ----------------------------------------------
        
        NSArray *quickSortData = @[@15, @22, @13, @27, @12, @10, @20, @25];
        
        QuickSort *quick = [[QuickSort alloc] init];
        
        NSLog(@"quickSort : %@",[quick quickSort:quickSortData]);
    }
    return 0;
}
