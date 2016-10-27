//
//  ViewController.m
//  MyImagePicker
//
//  Created by david on 2016. 10. 27..
//  Copyright © 2016년 david. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
///imageView Gesture
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *rootViewGesture;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

//gesture method
- (IBAction)alertActionSheet:(id)sender
{
    //UIAlertController 생성
    UIAlertController *sheetAlert = [UIAlertController alertControllerWithTitle:@"사진" message:@"사진선택하기" preferredStyle:UIAlertControllerStyleActionSheet];
    
    //UIAlertAction 생성
    UIAlertAction *libraryAction = [UIAlertAction actionWithTitle:@"라이브러리" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
    {
        NSLog(@"");
    }];
    UIAlertAction *albumAction = [UIAlertAction actionWithTitle:@"사진앨범" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
    {
        NSLog(@"");
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"취소" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action)
    {
        NSLog(@"");
    }];
    
    //Action 추가
    [sheetAlert addAction:libraryAction];
    [sheetAlert addAction:albumAction];
    [sheetAlert addAction:cancelAction];
    
    //present
    [self presentViewController:sheetAlert animated:YES completion:
     ^{
        NSLog(@"");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
