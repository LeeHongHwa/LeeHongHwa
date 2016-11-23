//
//  ViewController.m
//  NetworkingMiniProject
//
//  Created by david on 2016. 11. 15..
//  Copyright © 2016년 david. All rights reserved.
//

#import "MainViewController.h"
#import "ImageViewController.h"
#import "ImageCell.h"

@interface MainViewController ()<UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
///navigationTitle
@property (weak, nonatomic) IBOutlet UINavigationItem *navigationTitle;
///imageTableView
@property (weak, nonatomic) IBOutlet UITableView *imageTableView;

///이미지 이름
@property NSString *imageName;
///선택된 이미지
@property UIImage *selectedImage;
///이미지 데이터 리스트
@property NSArray *imageDataList;
///refreshControl
@property UIRefreshControl *refreshControl;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //이미지 데이터 리스트 노티피케이션
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceiveImageUpdated)
                                                 name:imageListUpdatedNotification
                                               object:nil];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    _refreshControl.tintColor = [UIColor blueColor];
    [_refreshControl addTarget:[RequestObject class] action:@selector(requestImageList) forControlEvents:UIControlEventValueChanged];
    [_imageTableView addSubview:_refreshControl];

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if ([[UserInformation sharedUserInfo] userId] == nil)
    {
        [self showLoginAlert];
    }
}

#pragma mark - Reset
//tableView reset method
- (IBAction)clickResetButton:(UIBarButtonItem *)sender
{
    [RequestObject requestImageList];
}

#pragma mark - Notification
//이미지 데이터 리스트 selector method
- (void)didReceiveImageUpdated
{
    self.imageDataList = [[UserInformation sharedUserInfo] imageInfoList];
    [self.imageTableView reloadData];
    [_refreshControl endRefreshing];
}

#pragma mark - Alert
//user ID Alert
- (void)showLoginAlert
{
    //create Alert
    UIAlertController *loginAlert = [UIAlertController alertControllerWithTitle:@"아이디 입력"
                                                                        message:@"아이디"
                                                                 preferredStyle:UIAlertControllerStyleAlert];
    
    //create TextField
    [loginAlert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField)
     {
        textField.textAlignment = NSTextAlignmentCenter;
        textField.placeholder = @"아이디를 입력해주세요";
    }];
    
    //Setting Action Handler
    id actionHandler = ^(UIAlertAction * _Nonnull action)
    {
        if (loginAlert.textFields.firstObject.text.length == 0 ||
            [loginAlert.textFields.firstObject.text isEqualToString: @" "]||
            [loginAlert.textFields.firstObject.text integerValue] == 0)
        {
            [self showLoginAlert];
        }else
        {
            [[UserInformation sharedUserInfo] setUserId:loginAlert.textFields.firstObject.text];
        }
        [RequestObject requestImageList];
    };
    
    //create Action
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인"
                                                       style:UIAlertActionStyleDefault
                                                     handler:actionHandler];
    
    [loginAlert addAction:okAction];

    [self presentViewController:loginAlert animated:YES completion:nil];
}

//image Name Alert
- (void)showImageNameSettingAlert:(UIImage *)image
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"이미지 이름"
                                                                   message:@"이미지 이름을 입력해주세요"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    id actionHandler = ^(UIAlertAction * _Nonnull action) {
        if (alert.textFields.firstObject.text.length == 0 ||
            [alert.textFields.firstObject.text isEqualToString: @" "])
        {
            [self showImageNameSettingAlert:image];
        }
        [RequestObject requestUploadImageWithTitle:alert.textFields.firstObject.text image:image imageId:nil];
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

#pragma mark - TableView delegate
//tableView Row
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _imageDataList.count;
}

//tableView Cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //custom cell
    ImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"imageCell" forIndexPath:indexPath];
    
    //jason data
    NSDictionary *imageDataDic = [_imageDataList objectAtIndex:indexPath.row];
    cell.cellTitle.text = [imageDataDic objectForKey:@"title"];
    
    id dataTaskHandler = ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        UIImage *tumbnailImage = [UIImage imageWithData:data];
        dispatch_async(dispatch_get_main_queue(), ^{
            cell.cellImageView.image = tumbnailImage;
        });
    };
    
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:[imageDataDic objectForKey:@"thumbnail_url"]] completionHandler:dataTaskHandler];
    
    [dataTask resume];
    
    return cell;
}

//tableView Select
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.selected = NO;
}

//tableView Edit
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        NSDictionary *imageInfo = [_imageDataList objectAtIndex:indexPath.row];
        [RequestObject requestDeleteImageWithImageId:[imageInfo objectForKey:JSONImageIDKey]];
    }
}

#pragma mark - ImagePickerView
//show imagePicker
- (IBAction)clickImagePickerViewButton:(UIBarButtonItem *)sender
{
    [self showImagePicker:UIImagePickerControllerSourceTypePhotoLibrary];
}

- (void)showImagePicker:(UIImagePickerControllerSourceType)sourceType
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    [picker setDelegate:self];
    [picker setSourceType:sourceType];
    [picker setAllowsEditing:NO];
    [self presentViewController:picker animated:YES completion:nil];
}

#pragma mark - ImagePickerView delegate
//select imagePicker
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *selectedImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self dismissViewControllerAnimated:YES completion:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self showImageNameSettingAlert:selectedImage];
        });
    }];
}

//화면전환이 일어나기전에 호출되는 메서드 sender에는 segue가 시작되는 객체가 들어오고 segue는 segue와 관련된 VC(2개)를 가지고있다.
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UITableViewCell *cell = sender;
    NSIndexPath *cellIndex = [_imageTableView indexPathForCell:cell];
    NSDictionary *imageInfo = [_imageDataList objectAtIndex:cellIndex.row];
    
    ImageViewController *imageViewController = segue.destinationViewController;
    imageViewController.imageInfo = imageInfo;
}

//remove Notification Observer
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
