//
//  MySingleton.h
//  Example1031
//
//  Created by david on 2016. 10. 31..
//  Copyright © 2016년 david. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MySingleton : NSObject

- (void)justMethod;
+ (instancetype)sharedInstance;

@end
