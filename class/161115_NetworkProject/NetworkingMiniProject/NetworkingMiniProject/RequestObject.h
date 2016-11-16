//
//  RequestObject.h
//  NetworkingMiniProject
//
//  Created by david on 2016. 11. 15..
//  Copyright © 2016년 david. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RequestObject : NSObject


//싱글턴 메서드
+ (id)sharedRequestManager;

//- (void)requestUploadImage:(NSString *)imageName imageData:(NSData *)imageData;

//이미지 리스트 요청
- (void)requestImageList;
//썸네일 이미지 요청
- (void)requestTumbnailImage:(NSString *)URL;
@end
