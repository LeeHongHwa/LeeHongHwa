//
//  RequestObject.m
//  NetworkingMiniProjectTeacher
//
//  Created by david on 2016. 11. 16..
//  Copyright © 2016년 david. All rights reserved.
//

#import "RequestObject.h"

static NSString *const basicURL = @"http://iosschool.yagom.net:8080";

@implementation RequestObject

+ (void)requestImageList
{
    NSString *userId = [[UserInformation sharedUserInfo] userId];
    NSString *destinationURLString = [NSString stringWithFormat:@"%@/api/list?user_id=%@", basicURL, userId];
    
    //create URL
    NSURL *destinationURL = [NSURL URLWithString:destinationURLString];
    
    //create request
    NSMutableURLRequest *requset = [[NSMutableURLRequest alloc] init];
    [requset setHTTPMethod:@"GET"];
    [requset setURL:destinationURL];
    
    //data는 바이너리데이타
    id taskHandler = ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
    {
//        NSLog(@"request image list response: %@, error: %@", response, error);
        
        NSError *jsonParsingError;
        NSDictionary *jsonResult =[NSJSONSerialization JSONObjectWithData:data
                                                                   options:NSJSONReadingMutableLeaves
                                                                     error:&jsonParsingError];
//        NSLog(@"jason parsing error : %@, jsson result : %@", jsonParsingError, jsonResult);
        NSArray *imageInfoList = [jsonResult objectForKey:@"list"];
        [[UserInformation sharedUserInfo] setImageInfoList:imageInfoList];
        
        NSString *notificationName = nil;
        
        if (imageInfoList == nil)
        {//실패
            notificationName = ImageListUpdateFailedNotification;
        } else
        {//성공
            notificationName = ImageListUpdatedNotification;
        }
        
        //받아서 처리할 쓰레드 이다.
        dispatch_async(dispatch_get_main_queue(), ^{
            [[NSNotificationCenter defaultCenter] postNotificationName:notificationName object:nil];
        });
        
    };
    
    //create NSURLSessionDataTask request를 보내는 역할
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:requset
                                                completionHandler:taskHandler];
    [dataTask resume];
}

+ (void)requestUploadImage:(UIImage *)image title:(NSString *)title userId:(NSString *)userId
{
//    NSString *userId = [[UserInformation sharedUserInfo] userId];
    NSString *destinationURLString = [NSString stringWithFormat:@"%@/api/upload", basicURL];
    
    //create URL
    NSURL *destinationURL = [NSURL URLWithString:destinationURLString];
    
    //create request
    NSMutableURLRequest *requset = [[NSMutableURLRequest alloc] init];
    [requset setHTTPMethod:@"POST"];
    [requset setURL:destinationURL];
    
    NSString *boundaryString = @"--------------honghwa"; //----4개이상
    //데이터 폼과 바운더리는 이거다
    NSString *contentDescription = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundaryString];
    
    //헤더에 넣어준다 폼과 바운더리를 보낸다 개발자야 봐라
    //헤더부분에 Content-Type이라는 영역에 넣어준다
    [requset addValue:contentDescription
   forHTTPHeaderField:@"Content-Type"];
    
    NSMutableData *bodyData = [[NSMutableData alloc] init];
    
    //바이너리 데이터로 변경
    //바운더리
    NSData *boundaryData = [[NSString stringWithFormat:@"--%@\r\n", boundaryString] dataUsingEncoding:NSUTF8StringEncoding];
    
    [bodyData appendData:boundaryData];
    
    //파라미터의 종류
    //user_id
    NSData *nameData = [[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"user_id\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding];
    [bodyData appendData:nameData];
    
    NSData *valueData = [[NSString stringWithFormat:@"%@\r\n", userId] dataUsingEncoding:NSUTF8StringEncoding];
    [bodyData appendData:valueData];
    
    [bodyData appendData:boundaryData];
    
    //title
    nameData = [[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"title\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding];
    [bodyData appendData:nameData];
    
    valueData = [[NSString stringWithFormat:@"%@\r\n", title] dataUsingEncoding:NSUTF8StringEncoding];
    [bodyData appendData:valueData];
    
    [bodyData appendData:boundaryData];
    
    //image
    nameData = [[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"image_data\"; filename=\"image.jpeg\"\r\n"] dataUsingEncoding:NSUTF8StringEncoding];
    [bodyData appendData:nameData];
    
    NSData *imageContentTypeData = [@"Content-Type: image/jpeg\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding];
    [bodyData appendData:imageContentTypeData];
    
    NSData *imageData = UIImageJPEGRepresentation(image, 0.1);
    [bodyData appendData:imageData];
    
    NSData *finishBoundaryData = [[NSString stringWithFormat:@"\r\n--%@--\r\n",boundaryString] dataUsingEncoding:NSUTF8StringEncoding];
    
    //end
    [bodyData appendData:finishBoundaryData];
    
    [requset setHTTPBody:bodyData];
    
    
    id uploadHandler = ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
    {
        if (error != nil)
        {
            NSLog(@"Error occured : %@", error);
            return;
        }
        
        if (data == nil)
        {
            NSLog(@"Data dosen't exist");
            return;
        }
        
        NSLog(@"%@", response);
        
        NSDictionary *jsonResult = [NSJSONSerialization JSONObjectWithData:data
                                                                    options:NSJSONReadingMutableLeaves
                                                                      error:nil];
        NSLog(@"%@", jsonResult);
        
        if ([[jsonResult objectForKey:@"result"] isEqualToString:@"success"])
        {
            [self requestImageList];
        }
    };

    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionUploadTask *uploadTask = [session uploadTaskWithRequest:requset
                                                               fromData:nil
                                                      completionHandler:uploadHandler];
    [uploadTask resume];
}
+ (void)requestDeleteImage:(NSString *)userId imageId:(NSString *)imageId
{
    id deleteHandler = ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
        {
        
        NSError *jsonError;
        
        NSDictionary *jsonDataDic = [NSJSONSerialization JSONObjectWithData:data
                                                                    options:NSJSONReadingMutableLeaves
                                                                      error:&jsonError];
        if ([jsonDataDic objectForKey:@"data"] == nil)
        {
            NSLog(@"삭제된 ID가 없습니다");
        }else
        {
            NSLog(@"삭제된 ID : %@",[jsonDataDic objectForKey:@"data"]);
        }
        
        if ([[jsonDataDic objectForKey:@"result"] isEqualToString:@"fail"])
        {
            NSLog(@"삭제에 실패했습니다");
            return;
        } else
        {
            NSLog(@"%@", [jsonDataDic objectForKey:@"result"]);
        }
        //reload
        [self requestImageList];
    };
    
    NSURL *destinationURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/api/image?user_id=%@&image_id=%@", basicURL, userId, imageId]];
    NSMutableURLRequest *requset = [[NSMutableURLRequest alloc] init];
    requset.URL = destinationURL;
    requset.HTTPMethod = @"DELETE";
    
    //session
    NSURLSession *session = [NSURLSession sharedSession];
    //session Task
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:requset
                                                completionHandler:deleteHandler];
    
    //resume
    [dataTask resume];
}

+ (void)requestChangeImageWithImageId:(NSString *)imageId image:(UIImage *)image title:(NSString *)title
{
    NSString *userId = [[UserInformation sharedUserInfo] userId];
    
    NSURL *destinationURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/api/upload", basicURL]];
    
    NSMutableURLRequest *requset = [[NSMutableURLRequest alloc] init];
    requset.URL = destinationURL;
    requset.HTTPMethod = @"POST";
    
    NSString *boundaryString = @"----HONG_BOUNDARY_STRING";
    NSString *contentDescription = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundaryString];
    
    [requset addValue:contentDescription
   forHTTPHeaderField:@"Content-Type"];
    
    NSMutableData *bodyData = [[NSMutableData alloc] init];
    
    //1
    //data Start boundary
    NSData *boundaryData = [[NSString stringWithFormat:@"--%@\r\n", boundaryString] dataUsingEncoding:NSUTF8StringEncoding];
    [bodyData appendData:boundaryData];
    
    //user ID
    NSData *nameData = [[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"user_id\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding];
    [bodyData appendData:nameData];
    
    NSData *valueData = [[NSString stringWithFormat:@"%@\r\n",userId] dataUsingEncoding:NSUTF8StringEncoding];
    [bodyData appendData:valueData];
    
    //2
    [bodyData appendData:boundaryData];

    //image ID
    nameData = [[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"id\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding];
    [bodyData appendData:nameData];
    
    valueData = [[NSString stringWithFormat:@"%@\r\n",imageId] dataUsingEncoding:NSUTF8StringEncoding];
    [bodyData appendData:valueData];
    
    //3
    [bodyData appendData:boundaryData];
    
    //image Title
    nameData = [[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"title\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding];
    [bodyData appendData:nameData];
    
    valueData = [[NSString stringWithFormat:@"%@\r\n",title] dataUsingEncoding:NSUTF8StringEncoding];
    [bodyData appendData:valueData];
    
    //4
    [bodyData appendData:boundaryData];
    
    nameData = [[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"image_data\"; filename=\"image.jpg\"\r\n"] dataUsingEncoding:NSUTF8StringEncoding];
    [bodyData appendData:nameData];
    
    NSData *imageContentTypeData = [[NSString stringWithFormat:@"Content-Type: image/jpeg\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding];
    [bodyData appendData:imageContentTypeData];
    
    NSData *imageData = UIImageJPEGRepresentation(image, 0.1);
    [bodyData appendData:imageData];
    
    NSData *finishData = [[NSString stringWithFormat:@"\r\n--%@--\r\n",boundaryString] dataUsingEncoding:NSUTF8StringEncoding];
    
    [bodyData appendData:finishData];

    
    id uploadTaskHandler = ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
    {
        
        NSLog(@"%@",response);
        
        NSError *jsonError;
        
        NSDictionary *uploadTaskDic = [NSJSONSerialization JSONObjectWithData:data
                                                                      options:NSJSONReadingMutableLeaves error:&jsonError];
        NSString *changedImageURLString = [uploadTaskDic objectForKey:@"data"];
        NSString *result = [uploadTaskDic objectForKey:@"result"];
        
        if (changedImageURLString == nil)
        {
            NSLog(@"전달받은 데이터가 없습니다");
        }
        NSLog(@"이미지 변경 상태 %@ 전달받은 url %@",result, changedImageURLString);
        
        [self requestImageList];
        
    };
    
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionUploadTask *uploadTask = [session uploadTaskWithRequest:requset
                                                               fromData:bodyData completionHandler:uploadTaskHandler];
    
    [uploadTask resume];
}

@end
