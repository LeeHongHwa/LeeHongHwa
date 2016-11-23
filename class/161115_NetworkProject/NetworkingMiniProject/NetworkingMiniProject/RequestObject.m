//
//  RequestObject.m
//  NetworkingMiniProject
//
//  Created by david on 2016. 11. 15..
//  Copyright © 2016년 david. All rights reserved.
//

#import "RequestObject.h"

//Request Type
typedef NS_ENUM(NSInteger, RequestType)
{
    RequestTypeImageList,
    RequestTypeUploadImage,
    RequestTypeDeleteImage
};

//Parameter Name
static NSString *const ParamNameUserIDKey = @"user_id";
static NSString *const ParamNameImageTitlekey = @"title";
static NSString *const ParamNameImageDatakey = @"image_data";
static NSString *const ParamNameImageIDkey = @"image_id";

//Base URL String
static NSString *const baseURLString = @"http://iosschool.yagom.net:8080/";

//JSON Key
static NSString *const JSONContentKey = @"list";
static NSString *const JSONResultKey = @"result";

//JSON Value
static NSString *const JSONSuccessValue = @"success";

@implementation RequestObject

+ (NSURL *)requestURL:(RequestType)type param:(NSDictionary *)paramDic
{
    //Host + Path
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
    
    //Parameter Name + Value
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


//Requset Image List
+ (void)requestImageList
{
    //create dataTaskHandler
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
            } else if ([imageListDict objectForKey:JSONContentKey] != nil)
            {
                NSLog(@"success");
                
                [[UserInformation sharedUserInfo] setImageInfoList:[imageListDict objectForKey:@"list"]];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
                    [[NSNotificationCenter defaultCenter] postNotificationName:imageListUpdatedNotification
                                                                        object:nil];
                });
            }
        }
    };
    
    NSString *value = [[UserInformation sharedUserInfo] userId];
    NSURL *requestURL = [RequestObject requestURL:RequestTypeImageList
                                   param:@{ParamNameUserIDKey:value}];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:requestURL
                                            completionHandler:dataTaskHandler];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    [dataTask resume];
}

//create HTTPBody
/*
 1. boundary\r\n
 2. Content-Type\r\n x 2(string은 생략가능)
 2. param\r\n
 3. data\r\n
 */
+ (void)requestUploadImageWithTitle:(NSString *)title image:(UIImage *)image imageId:(NSString *)imageId
{
    //create URL
    NSURL *requsetURL = [RequestObject requestURL:RequestTypeUploadImage param:nil];
    
    //create ConntentType
    NSString *boundary = @"----LeeHongHwa";
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary];
    
    //create Request
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:requsetURL];
    request.HTTPMethod = @"POST";
    [request addValue:contentType forHTTPHeaderField:@"Content-Type"];
    
    NSMutableData *body = [NSMutableData data];
    
    NSMutableDictionary *bodyParms = [NSMutableDictionary dictionary];
    [bodyParms setObject:[[UserInformation sharedUserInfo] userId]
                  forKey:ParamNameUserIDKey];
    
    [bodyParms setObject:title
                  forKey:ParamNameImageTitlekey];
    if (imageId != nil)
    {
        [bodyParms setObject:imageId forKey:@"id"];
    }
    
    NSData *boundaryData = [NSData dataWithData:[[NSString stringWithFormat:@"--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    for (NSString *key in bodyParms)
    {
        [body appendData:boundaryData];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", key] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"%@\r\n",[bodyParms objectForKey:key]] dataUsingEncoding:NSUTF8StringEncoding]];
    }
    
    [body appendData:boundaryData];
    
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"image.jpeg\"\r\n", ParamNameImageDatakey] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Type: image/jpeg\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:UIImageJPEGRepresentation(image, 0.1)];
    NSString *finishBoundary = [NSString stringWithFormat:@"\r\n--%@--\r\n", boundary];
    [body appendData:[finishBoundary dataUsingEncoding:NSUTF8StringEncoding]];
    
    request.HTTPBody = body;
    
    //create URLSession
    id uploadTaskHandler = ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
    {
        NSLog(@"response: %@", response);
        if (error != nil)
        {
            NSLog(@"Error occured : %@", error);
        }
        if (data == nil)
        {
            NSLog(@"Data dosen't exist");
        } else
        {
            NSError *JSONError = nil;
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data
                                                                 options:NSJSONReadingAllowFragments
                                                                   error:&JSONError];
            if (JSONError != nil)
            {
                NSLog(@"JSONError :%@", JSONError);
            }
            if ([[dict objectForKey:JSONResultKey] isEqualToString:JSONSuccessValue])
            {
                NSLog(@"success");
                [RequestObject requestImageList];
                [[NSNotificationCenter defaultCenter] postNotificationName:ImageUploadDidSuccessNotification
                                                                    object:nil
                                                                  userInfo:dict];
                [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
            }
        }
    };
    
    NSURLSessionUploadTask *uploadTask = [[NSURLSession sharedSession] uploadTaskWithRequest:request
                                                                                    fromData:nil
                                                                           completionHandler:uploadTaskHandler];
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    [uploadTask resume];
    
}

+ (void)requestDeleteImageWithImageId:(NSString *)imageId
{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:[[UserInformation sharedUserInfo] userId] forKey:ParamNameUserIDKey];
    [params setObject:imageId forKey:ParamNameImageIDkey];
    
    //create RequestURL
    NSURL *requsetURL = [RequestObject requestURL:RequestTypeDeleteImage param:params];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:requsetURL];
    request.HTTPMethod = @"DELETE";
    
    //setting TaskSessionHandler
    id taskSessionHandler = ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"%@",response);
        if (error != nil)
        {
            NSLog(@"Error occured : %@",error);
        }
        if (data == nil) {
            NSLog(@"Data dosen't exist");
        } else
        {
            NSError *JSONError = nil;
            
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data
                                                                 options:NSJSONReadingAllowFragments
                                                                   error:&JSONError];
            if (JSONError != nil)
            {
                NSLog(@"JSONError occured: %@",JSONError);
            } else
            {
                if ([[dict objectForKey:JSONResultKey] isEqualToString:JSONSuccessValue])
                {
                    NSLog(@"success");
                    [RequestObject requestImageList];
                }
            }
        }
    };
    
    //create TaskSession
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:request
                                                                     completionHandler:taskSessionHandler];
    [dataTask resume];
}
























































@end
