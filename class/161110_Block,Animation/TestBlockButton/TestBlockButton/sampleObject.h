//
//  sampleObject.h
//  TestBlockButton
//
//  Created by david on 2016. 11. 10..
//  Copyright © 2016년 david. All rights reserved.
//

#import <Foundation/Foundation.h>
//typedef block
typedef NSInteger(^plusBlock)(NSInteger blockNumber);

@interface sampleObject : NSObject

///block property
@property plusBlock plusBlock;

//setBlock
- (void)plusNumber:(plusBlock)block;

//getBlock
- (NSInteger)playMethod:(NSInteger)count;
@end
