//
//  ViewController.m
//  NetworkingMiniProject
//
//  Created by david on 2016. 11. 15..
//  Copyright © 2016년 david. All rights reserved.
//

#import "MainViewController.h"
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
///썸네일 이미지
@property UIImage *tumbnailImage;
///이미지 데이터 리스트
@property NSArray *imageDataList;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *destinationURLString = [NSString stringWithFormat:@"www.naver.com/api/upload"];
    
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
    NSLog(@"request URL : %@",requset.allHTTPHeaderFields);
    
    
    //이미지 데이터 리스트 노티피케이션
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceiveImageListData:)
                                                 name:didReceiveImageListData
                                               object:nil];
    
    //이미지 데이터 썸네일 노티피케이션
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceiveTumbnailImage:)
                                                 name:didReceiveTumbnailImage
                                               object:nil];
    //show Alert
    [self showLoginAlert];
}

//tableView reset method
- (IBAction)clickResetButton:(UIBarButtonItem *)sender
{
    [self.imageTableView reloadData];
}

#pragma mark -
#pragma mark Notification
//이미지 데이터 리스트 selector method
- (void)didReceiveImageListData:(NSNotification *)notification
{
    self.imageDataList = [[notification userInfo] objectForKey:@"list"];
}

//이미지 데이터 썸네일 selector method
- (void)didReceiveTumbnailImage:(NSNotification *)notification
{
    NSData *tumbnailData = [[notification userInfo] objectForKey:tumbnailImage];
    
    self.tumbnailImage = [UIImage imageWithData:tumbnailData];
}


#pragma mark -
#pragma mark alert
//show Alert
- (void)showLoginAlert
{
    //input ID
    __block NSString *tempId;
    //temp TextField
    __block UITextField *tempField;
    //weakSelf
    __weak MainViewController *weakSelf = self;
    
    //create Alert
    UIAlertController *loginAlert = [UIAlertController alertControllerWithTitle:@"아이디 입력"
                                                                        message:@"아이디" preferredStyle:UIAlertControllerStyleAlert];
    
    //create TextField
    [loginAlert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.textAlignment = NSTextAlignmentCenter;
        textField.placeholder = @"아이디를 입력해주세요";
        tempField = textField;
    }];
    
    //create Action
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        tempId = tempField.text;
        
        //tempId input(O)
        if ([tempId length] > 0) {
            //set User ID
            [[UserInformation sharedUserInfo] setUserId:tempId];
            //show Navigation Title
            weakSelf.navigationTitle.title = tempId;
            //request Image List
            [[RequestObject sharedRequestManager] requestImageList];
            //table View Reload
            [self tableViewReload];
        }else
        {//tempId input(X)
            [self showLoginAlert];
        }
    }];
    
    [loginAlert addAction:okAction];

    [self presentViewController:loginAlert animated:YES completion:nil];
}


#pragma mark -
#pragma mark tableView Delegate
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
    [[RequestObject sharedRequestManager] requestTumbnailImage:[imageDataDic objectForKey:@"thumbnail_url"]];
    cell.cellImageView.image = _tumbnailImage;
    return cell;
}

//tableView Select
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.selected = NO;
}
#pragma mark -
#pragma mark tableView Method

- (void)tableViewReload
{
    //weakSelf
    __weak MainViewController *weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [weakSelf.imageTableView reloadData];
    });
}

#pragma mark -
#pragma mark imagePickerView
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

#pragma mark -
#pragma mark imagePickerView Delegate
//select imagePicker
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    //이미지 저장
//    __block UIImage *selectedImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    //이미지 이름 저장
    __block UITextField *imageNameTextField;
    
    //이미지 이름 입력
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"사진이름"
                                                                             message:@"사진이름을 입력해 주세요."
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        imageNameTextField = textField;
        imageNameTextField.textAlignment = NSTextAlignmentCenter;
        imageNameTextField.placeholder = @"이미지 이름을 입력해 주세요.";
    }];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인"
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * _Nonnull action) {
                                                         
                                                         //image 이름과 image 전송
//                                                         NSString *imageName = imageNameTextField.text;
                                                         
                                                         
                                                         //cell update
                                                         [self dismissViewControllerAnimated:YES completion:^{
                                                             nil;
                                                         }];
                                                     }];
    [alertController addAction:okAction];
    [picker presentViewController:alertController animated:YES completion:nil];
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
