//
//  ImageViewController.m
//  NetworkingMiniProjectTeacher
//
//  Created by david on 2016. 11. 16..
//  Copyright © 2016년 david. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceiveShowImageView:)
                                                 name:DidReceiveShowImageView
                                               object:nil];
    
}

- (void)didReceiveShowImageView:(NSNotification *)notification
{
    ImageViewController *__weak weakSelf = self;
    NSString *title = [[notification userInfo] objectForKey:@"title"];
    for (NSDictionary *imageInfoTempDic in [[UserInformation sharedUserInfo] imageInfoList]) {
        if ([[imageInfoTempDic objectForKey:@"title"] isEqualToString:title])
        {
            NSString *imageURLString = [imageInfoTempDic objectForKey:@"image_url"];
            NSURL *imageURL = [NSURL URLWithString:imageURLString];
            
            NSURLSession *session = [NSURLSession new];
            NSURLSessionDataTask *dataTask = [session dataTaskWithURL:imageURL
                                                    completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                        
                                                        UIImage *image = [UIImage imageWithData:data];
                                                        dispatch_async(dispatch_get_main_queue(), ^{
                                                            weakSelf.imageView.image = image;
                                                        });
                                                    }];
            [dataTask resume];
            return;
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
