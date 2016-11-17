//
//  imageTableViewController.m
//  NetworkingMiniProjectTeacher
//
//  Created by david on 2016. 11. 16..
//  Copyright © 2016년 david. All rights reserved.
//

#import "ImageTableViewController.h"

@interface ImageTableViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property NSString *selectedCellImageTitle;

@end

@implementation ImageTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self.tableView
                                             selector:@selector(reloadData)
                                                 name:ImageListUpdatedNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(DidReceiveViewDidLoad:)
                                                 name:@"DidReceiveViewDidLoad"
                                               object:nil];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
    if ([[[UserInformation sharedUserInfo] userId] isEqualToString:self.navigationItem.title] == NO)
    {
        [self showUserIdAlert];
    }
}

- (void)showUserIdAlert
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"유저 ID 입력"
                                                                   message:@"유저 ID를 입력해주세요" preferredStyle:UIAlertControllerStyleAlert];
    
    //block은 객체이다.
    id actionHandler = ^(UIAlertAction * _Nonnull action)
    {
        //textField가 여러개이면 tag 값을 준다.
        if (alert.textFields.firstObject.text.length == 0 ||
            [alert.textFields.firstObject.text containsString:@" "] ||
            [alert.textFields.firstObject.text integerValue] == 0)
            
        {
            [self showUserIdAlert];
        } else
        {
            [[UserInformation sharedUserInfo] setUserId:alert.textFields.firstObject.text];
            self.navigationItem.title = alert.textFields.firstObject.text;
            [RequestObject requestImageList];
        }
    };
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인"
                                                       style:UIAlertActionStyleDefault
                                                     handler:actionHandler];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"100~150 사이의 숫자";
        textField.keyboardType = UIKeyboardTypeNumberPad;
        
    }];
    
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - IBAction

- (IBAction)clickRefreshButton:(UIBarButtonItem *)sender
{//사진 리스트 요청
    [RequestObject requestImageList];
}
- (IBAction)clickActionButton:(UIBarButtonItem *)sender
{// 이미지 피커를 보여주기
    [self showImagePicker];
}

- (void)showImagePicker
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    [imagePicker setDelegate:self];
    [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
 
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    NSLog(@"피커뷰 이미지 %@",image);
    
    //show alert
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"사진 제목"
                                                                    message:@"사진 제목을 입력해 주세요"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    //create block object
    id actionHandler = ^(UIAlertAction * _Nonnull action)
    {
        if (alert.textFields.firstObject.text == nil ||
            alert.textFields.firstObject.text.length == 0)
        {
            [self presentViewController:alert animated:YES completion:nil];
        } else
        {
            NSString *imageTitle = alert.textFields.firstObject.text;
            NSLog(@"이미지의 제목은 : %@ 입니다.",imageTitle);
            
            [RequestObject requestUploadImage:image title:imageTitle userId:[[UserInformation sharedUserInfo] userId]];
            
        }
    };
    //create action
    UIAlertAction *okAciton = [UIAlertAction actionWithTitle:@"확인"
                                                       style:UIAlertActionStyleDefault
                                                     handler:actionHandler];
    //create alert textField
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"이미지를 제목을 입력해 주세요";
        textField.textAlignment = NSTextAlignmentCenter;
        
    }];
    //add action
    [alert addAction:okAciton];
    
    //dismiss picker
    [picker dismissViewControllerAnimated:YES
                               completion:^{
                                   [self presentViewController:alert animated:YES completion:nil];
                               }];

}

#pragma mark - Table view data source

//- (void)showAlertWithTitle:(NSString *)title actionTitle:(NSString *)actionTitle
//{
//    if ([title isEqualToString:@"사진 제목"])
//    {
//        //show alert
//        UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
//                                                                       message:@"사진 제목을 입력해 주세요"
//                                                                preferredStyle:UIAlertControllerStyleAlert];
//        //create block object
//        id actionHandler = ^(UIAlertAction * _Nonnull action)
//        {
//            NSLog(@"이미지의 제목은 : %@ 입니다.",alert.textFields.firstObject.text);
//        };
//        //create action
//        UIAlertAction *okAciton = [UIAlertAction actionWithTitle:@"확인"
//                                                           style:UIAlertActionStyleDefault
//                                                         handler:actionHandler];
//        //create alert textField
//        [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
//            textField.placeholder = @"이미지를 제목을 입력해 주세요";
//            textField.textAlignment = NSTextAlignmentCenter;
//            
//        }];
//        //add action
//        [alert addAction:okAciton];
//    }
//    
//}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[UserInformation sharedUserInfo] imageInfoList] count];
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageCell" forIndexPath:indexPath];
    
    
    NSDictionary *imageInfoDic = [[[UserInformation sharedUserInfo] imageInfoList] objectAtIndex:indexPath.row];
    
    NSString *imageTitle = [imageInfoDic objectForKey:@"title"];
    NSString *thumbnailURLString = [imageInfoDic objectForKey:@"thumbnail_url"];
    
    NSURL *thumbnailURL = [NSURL URLWithString:thumbnailURLString];
    
    //dataWithContentsOfURL 메인쓰레드니깐 네트워크 말고 로컬을 위한 메서드
//    UIImage *thumbnailImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:thumbnailURL]];
    
    id imageTaskHandler = ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
    {
        UIImage *image = [UIImage imageWithData:data];
        dispatch_async(dispatch_get_main_queue(), ^{
            //cellForRow 생각해보기
            UITableViewCell *cellForUpdate = [tableView cellForRowAtIndexPath:indexPath];
            cellForUpdate.imageView.image = image;
        });
    };
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:thumbnailURL
                                            completionHandler:imageTaskHandler];
    
    [dataTask resume];
    
    cell.textLabel.text = imageTitle;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        
        UITableViewCell *editedCell = [tableView cellForRowAtIndexPath:indexPath];
        
        for (NSDictionary *imageInfoTempDic in [[UserInformation sharedUserInfo] imageInfoList])
        {
            NSString *imageName = [imageInfoTempDic objectForKey:@"title"];
            if ([imageName isEqualToString:editedCell.textLabel.text])
            {
                NSString *imageId = [imageInfoTempDic objectForKey:@"id"];
                [RequestObject requestDeleteImage:[[UserInformation sharedUserInfo] userId] imageId:imageId];
                return;
            }
            
        }
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    self.selectedCellImageTitle = selectedCell.textLabel.text;
}

- (void)DidReceiveViewDidLoad:(NSNotification *)notification
{
    [[NSNotificationCenter defaultCenter] postNotificationName:DidReceiveShowImageView
                                                        object:nil
                                                      userInfo:@{@"title":self.selectedCellImageTitle}];
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
