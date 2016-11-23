//
//  RequestObject.h
//  NetworkingMiniProject
//
//  Created by david on 2016. 11. 15..
//  Copyright © 2016년 david. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RequestObject : NSObject

//이미지 리스트 요청
+ (void)requestImageList;

//이미지 업로드
+ (void)requestUploadImageWithTitle:(NSString *)title image:(UIImage *)image imageId:(NSString *)imageId;

//이미지 삭제
+ (void)requestDeleteImageWithImageId:(NSString *)imageId;

@end
