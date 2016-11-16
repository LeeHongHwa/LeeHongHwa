//
//  RequestObject.h
//  NetworkingMiniProjectTeacher
//
//  Created by david on 2016. 11. 16..
//  Copyright © 2016년 david. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RequestObject : NSObject

+ (void)requestImageList;
+ (void)requestUploadImage:(UIImage *)image title:(NSString *)title userId:(NSString *)userId;
+ (void)requestDeleteImage:(NSString *)userId imageId:(NSString *)imageId;

@end
