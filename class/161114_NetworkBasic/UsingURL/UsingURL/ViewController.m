//
//  ViewController.m
//  UsingURL
//
//  Created by david on 2016. 11. 14..
//  Copyright © 2016년 david. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
///인디케이터
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicatorView;
///이미지뷰
@property (weak, nonatomic) IBOutlet UIImageView *carImageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

//이미지 다운로드 버튼
- (IBAction)clickImageDownloadButton:(UIButton *)sender
{
    //weakSelf
    __weak ViewController *weakSelf = self;

    //create URL
    NSURL *carURL = [NSURL URLWithString:@"http://cdn1.autoexpress.co.uk/sites/autoexpressuk/files/2016/07/audi_a3_cabriolet_041.jpg"];
    
    //create URLSession
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    //create URLSessionTask
    NSURLSessionTask *task = [session dataTaskWithURL:carURL
                                    completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                        //data가 있다면
                                        if (data)
                                        {
                                            //이미지 저장
                                            UIImage *image = [UIImage imageWithData:data];
                                            if (image)
                                            {
                                                //이미지가 있다면 메인큐에 화면에 이미지 출력 요청
                                                dispatch_sync(dispatch_get_main_queue(), ^{
                                                    weakSelf.carImageView.image = image;
                                                    
                                                    //stop indicator
                                                    [weakSelf.indicatorView stopAnimating];
                                                });
                                            }
                                        }
                                    }];
    if (sender.selected == NO)
    {//on
        sender.selected = YES;
        //download resume
        [task resume];
        //start indicatorView
        [self.indicatorView startAnimating];
    }else
    {//off
        sender.selected = NO;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
