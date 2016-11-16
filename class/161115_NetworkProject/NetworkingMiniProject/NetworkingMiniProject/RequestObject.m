//
//  RequestObject.m
//  NetworkingMiniProject
//
//  Created by david on 2016. 11. 15..
//  Copyright © 2016년 david. All rights reserved.
//

#import "RequestObject.h"

static NSString *const basicURL = @"http://iosschool.yagom.net";

@implementation RequestObject

//singleton
+ (id)sharedRequestManager {
    static RequestObject *sharedRequestManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedRequestManager = [[self alloc] init];
    });
    return sharedRequestManager;
}

//- (void)requestUploadImage:(NSString *)imageName imageData:(NSData *)imageData
//{
//    //image File
//    NSString *boundary = @"YOURE_BOUNDARY_STRING";
//    NSMutableData *body = [NSMutableData data];
//    
//    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"photo\"; filename=\"%@.png\"\r\n",imageName] dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    [body appendData:[@"Content-Type: image/png\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    [body appendData:[NSData dataWithData:imageData]];
//    
//    //image Name
//    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"imageName\"; filename=\"%@.png\"\r\n",imageName] dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    [body appendData:[@"Content-Type: image/png\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    [body appendData:[NSData dataWithData:imageData]];
//    
//}

//requset Image List
- (void)requestImageList {
    
    //session
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    //request
    NSURL *requestURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@:8080/api/list?user_id=%@",basicURL, [[UserInformation sharedUserInfo] userId]]];
    
    //requestURL
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:requestURL];
    request.HTTPMethod = @"GET";
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                    
                                                    NSDictionary *imageListDic = [NSJSONSerialization JSONObjectWithData:data
                                                                                                                 options:NSJSONReadingAllowFragments
                                                                                                                   error:&error];
                                                    
                                                    
//                                                    //post Notification
//                                                    [[NSNotificationCenter defaultCenter] postNotificationName:didReceiveImageListData
//                                                                                                        object:nil
//                                                                                                      userInfo:imageListDic];
                                                }];
    //start task
    [dataTask resume];
}

//requset Tumbnail Image
- (void)requestTumbnailImage:(NSString *)URL;
{
    //NSURL
    NSURL *tumbnailURL = [NSURL URLWithString:URL];
    
    //NSURL Session
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    //NSURL Session Task
    NSURLSessionTask *task = [session dataTaskWithURL:tumbnailURL
                                    completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {

                                        //post Notification
                                        [[NSNotificationCenter defaultCenter] postNotificationName:didReceiveTumbnailImage
                                                                                            object:nil
                                                                                          userInfo:@{tumbnailImage:data}];

                                    }];
    //start task
    [task resume];
}
@end
