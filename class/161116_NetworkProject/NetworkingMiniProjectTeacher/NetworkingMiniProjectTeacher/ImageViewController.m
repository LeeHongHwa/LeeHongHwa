//
//  ImageViewController.m
//  NetworkingMiniProjectTeacher
//
//  Created by david on 2016. 11. 16..
//  Copyright © 2016년 david. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property NSString *currentImageId;

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceiveShowImageView:)
                                                 name:DidReceiveShowImageView
                                               object:nil];

    //나 로드됬으 보내유
    [[NSNotificationCenter defaultCenter] postNotificationName:@"DidReceiveViewDidLoad"
                                                        object:nil];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
//    if (_imageView.image != nil)
//    {
//        for (NSDictionary *imageInfoDic in [[UserInformation sharedUserInfo] imageInfoList])
//        {
//            if ([_currentImageId isEqualToString:[imageInfoDic objectForKey:@"id"]])
//            {
//                NSString *imageURLString = [imageInfoDic objectForKey:@"image_url"];
//                NSURL *imageURL = [NSURL URLWithString:imageURLString];
//                ImageViewController *__weak weakSelf = self;
//                
//                NSURLSessionTask *dataTask = [[NSURLSession sharedSession] dataTaskWithURL:imageURL
//                                                                         completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//                                                                             UIImage *changeImage = [UIImage imageWithData:data];
//                                                                             dispatch_async(dispatch_get_main_queue(), ^{
//                                                                                 weakSelf.imageView.image = changeImage;
//                                                                             });
//                                                                         }];
//                [dataTask resume];
//            }
//        }
//    }

}
- (void)didReceiveShowImageView:(NSNotification *)notification
{
    ImageViewController *__weak weakSelf = self;
    
    NSString *title = [[notification userInfo] objectForKey:@"title"];
    for (NSDictionary *imageInfoTempDic in [[UserInformation sharedUserInfo] imageInfoList]) {
        if ([[imageInfoTempDic objectForKey:@"title"] isEqualToString:title])
        {
            weakSelf.currentImageId = [imageInfoTempDic objectForKey:@"id"];
            id imageTaskHndler = ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
            {
                UIImage *detailImage = [UIImage imageWithData:data];
                dispatch_async(dispatch_get_main_queue(), ^{
                    weakSelf.imageView.image = detailImage;
                });
            };
            
            NSString *imageURLString = [imageInfoTempDic objectForKey:@"image_url"];
            NSURL *imageURL = [NSURL URLWithString:imageURLString];
            NSURLSession *session = [NSURLSession sharedSession];
            NSURLSessionDataTask *dataTask = [session dataTaskWithURL:imageURL
                                                    completionHandler:imageTaskHndler];
            [dataTask resume];
            return;
        }
    }
}
- (IBAction)clickChangeImageButton:(UIBarButtonItem *)sender
{
    [self showImagePickerView];
    
}


//유알엘에 해당하는 이미지의 아이디를 찾자 찾아서 노티로 알려주자

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *__block changedImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    
    //create alertController
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"이미지 제목"
                                                                   message:@"이미지 제목을 입력해주세요" preferredStyle:UIAlertControllerStyleAlert];
    //alertAction Handler
    id alertActionHandler = ^(UIAlertAction * _Nonnull action)
    {
        if (alert.textFields.firstObject.text == nil ||
            alert.textFields.firstObject.text.length == 0 ||
            [alert.textFields.firstObject.text isEqualToString:@" "]) {
            [picker presentViewController:alert animated:YES completion:nil];
        }else
        {
            NSString *imageTitle = alert.textFields.firstObject.text;
            
            //rquest Change Image (image_id(이전데이터), title, image_data)
            [RequestObject requestChangeImageWithImageId:_currentImageId
                                                   image:changedImage
                                                   title:imageTitle];
            
            [picker dismissViewControllerAnimated:YES completion:nil];
        }
    };
    
    //create alertAciton
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인"
                                                       style:UIAlertActionStyleDefault
                                                     handler:alertActionHandler];
    
    //textField Handler
    id textFieldHandler = ^(UITextField * _Nonnull textField) {
        textField.placeholder = @"이미지 제목을 입력해주세요";
    };
    
    //add TextField
    [alert addTextFieldWithConfigurationHandler:textFieldHandler];
    
    //add Action
    [alert addAction:okAction];
    
    //present alert
    [picker presentViewController:alert animated:YES completion:nil];
}


- (void)showImagePickerView
{
    UIImagePickerController *imagePicker;
    imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:imagePicker animated:YES completion:nil];
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
