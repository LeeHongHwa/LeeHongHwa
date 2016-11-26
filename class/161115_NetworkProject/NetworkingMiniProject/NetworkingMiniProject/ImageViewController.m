//
//  ImageViewController.m
//  NetworkingMiniProject
//
//  Created by david on 2016. 11. 23..
//  Copyright © 2016년 david. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

//imageView
@property (weak, nonatomic) IBOutlet UIImageView *detailImageView;

@end

@implementation ImageViewController

#pragma mark - ViewController Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadImageFromURLSting:[_imageInfo objectForKey:JSONImageURLKey]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceiveImageUploadSuccessNotification:)
                                                 name:ImageUploadDidSuccessNotification
                                               object:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Notification Method
- (void)didReceiveImageUploadSuccessNotification:(NSNotification *)noti
{
    NSString *imageURLSting = [[noti userInfo] objectForKey:@"data"];
    [self loadImageFromURLSting:imageURLSting];
}

#pragma mark - Load Image
- (void)loadImageFromURLSting:(NSString *)URL
{
    /*
    id dataTaskHandler = ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
    {
        UIImage *image = [UIImage imageWithData:data];
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.detailImageView.image = image;
        });
    };
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:URL] completionHandler:dataTaskHandler];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    [dataTask resume];
    */
    
    //SDWebImage
    [self.detailImageView sd_setImageWithURL:[NSURL URLWithString:URL]
                            placeholderImage:[UIImage imageNamed:@"dummyImage"]
                                   completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                                       [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
          
                                           [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
                                       
                                   }];
//    [[SDImageCache sharedImageCache] setShouldCacheImagesInMemory:NO];
    if ([[SDImageCache sharedImageCache] imageFromDiskCacheForKey:URL] == nil)
    {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    };
    
}

#pragma mark - Show Image Picker View
- (IBAction)clickEditButton:(UIBarButtonItem *)sender
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    [self presentViewController:imagePicker animated:YES completion:nil];
}

#pragma mark - Image Picker View Controller Delegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    id dissmissHandler = ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self showImageNameSettingAlert:image imageId:[_imageInfo objectForKey:JSONImageIDKey]];
        });
    };
    
    [picker dismissViewControllerAnimated:YES
                               completion:dissmissHandler];
}

#pragma mark - Alert
//sho image title alert
- (void)showImageNameSettingAlert:(UIImage *)image imageId:(NSString *)imageId
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"이미지 이름"
                                                                   message:@"이미지 이름을 입력해주세요"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    id actionHandler = ^(UIAlertAction * _Nonnull action) {
        if (alert.textFields.firstObject.text.length == 0 ||
            alert.textFields.firstObject.text == nil)
        {
            [self showImageNameSettingAlert:image imageId:imageId];
        }
        [RequestObject requestUploadImageWithTitle:alert.textFields.firstObject.text image:image imageId:imageId];
    };
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인"
                                                       style:UIAlertActionStyleDefault
                                                     handler:actionHandler];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField)
     {
         textField.textAlignment = NSTextAlignmentCenter;
         textField.placeholder = @"사진의 이름을 입력해주세요";
     }];
    
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
}
@end
