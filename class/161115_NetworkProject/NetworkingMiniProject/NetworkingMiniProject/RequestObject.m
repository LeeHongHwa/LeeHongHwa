//
//  RequestObject.m
//  NetworkingMiniProject
//
//  Created by david on 2016. 11. 15..
//  Copyright © 2016년 david. All rights reserved.
//

#import "RequestObject.h"

typedef NS_ENUM(NSInteger, RequestType)
{
    RequestTypeImageList,
    RequestTypeUploadImage,
    RequestTypeDeleteImage
};

static NSString *const ParamNameUserIDKey = @"user_id";
static NSString *const ParamNameImageTitlekey = @"title";
static NSString *const ParamNameImageDatakey = @"image_data";
static NSString *const ParamNameImageIDkey = @"image_id";

static NSString *const baseURLString = @"http://iosschool.yagom.net:8080/";


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


- (NSURL *)requestURL:(RequestType)type param:(NSDictionary *)paramDic
{
    NSMutableString *urlString = [baseURLString mutableCopy];
    switch (type)
    {
        case RequestTypeImageList:
            [urlString appendString:@"api/list"];
            break;
            
        case RequestTypeDeleteImage:
            [urlString appendString:@"api/image"];
            break;
            
        case RequestTypeUploadImage:
            [urlString appendString:@"api/upload"];
            break;
            
        default:
            return nil;
            break;
    }
    
    if (paramDic.count)
    {
        NSMutableString *paramString = [NSMutableString stringWithFormat:@"?"];
        
        for (NSString *key in paramDic)
        {
            [paramString appendString:key];
            [paramString appendString:@"="];
            
            id value = paramDic[key];
            if ([value isKindOfClass:[NSString class]])
            {
                [paramString appendString:value];
            } else
            {
                value = [NSString stringWithFormat:@"%@", value];
                [paramString appendString:value];
            }
            [paramString appendString:@"&"];
        }
        [urlString appendString:paramString];
    }
    
    return [NSURL URLWithString:urlString];
}


//requset Image List
- (void)requestImageList
{
    id dataTaskHandler = ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
    {
        NSLog(@"%@", response);
        NSLog(@"%@", error);
        
        if (data == nil) {
            NSLog(@"데이터가 없습니다");
        } else
        {
            NSError *JSONError;
            NSDictionary *imageListDict = [NSJSONSerialization JSONObjectWithData:data
                                            options:NSJSONReadingMutableLeaves
                                              error:&JSONError];
            if (JSONError != nil)
            {
                NSLog(@"%@",JSONError);
            } else
            {
                [[UserInformation sharedUserInfo] setImageInfoList:[imageListDict objectForKey:@"list"]];
            }
        }
        
    };
    
    NSString *value = [[UserInformation sharedUserInfo] userId];
    NSURL *requestURL = [self requestURL:RequestTypeImageList param:@{ParamNameUserIDKey:value}];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:requestURL
                                            completionHandler:dataTaskHandler];
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
