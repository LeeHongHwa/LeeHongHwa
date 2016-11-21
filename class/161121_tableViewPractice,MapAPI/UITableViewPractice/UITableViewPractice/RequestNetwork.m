//
//  RequestNetwork.m
//  UITableViewPractice
//
//  Created by david on 2016. 11. 21..
//  Copyright © 2016년 david. All rights reserved.
//

#import "RequestNetwork.h"


@implementation RequestNetwork

+ (void)requestImageList
{
    NSURL *URL = [NSURL URLWithString:@"http://iosschool.yagom.net:8080/api/list?user_id=200"];
    NSMutableURLRequest *requestURL = [NSMutableURLRequest requestWithURL:URL];
    requestURL.HTTPMethod = @"GET";
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:requestURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (data == nil)
        {
            NSLog(@"요청한 데이터가 없습니다");
        }
        
        if (error != nil)
        {
            NSLog(@"%@",error);
        }
        NSLog(@"%@",response);
        
        NSError *JSONError;
        
        NSDictionary *imageListDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&JSONError];
        NSArray *imageListArr = [imageListDict objectForKey:@"list"];
        [[UserInfoData sharedUserInfoData] setUserInfoArr:imageListArr];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            //다운로드가 viewDidLoad보다 늦게될거라는 믿음?
            [[NSNotificationCenter defaultCenter] postNotificationName:imageListDownloadNotification object:nil];
        });
    }];
    
    [dataTask resume];
}

@end
