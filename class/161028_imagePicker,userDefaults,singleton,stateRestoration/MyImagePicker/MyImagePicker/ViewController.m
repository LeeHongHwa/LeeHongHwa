//
//  ViewController.m
//  MyImagePicker
//
//  Created by david on 2016. 10. 27..
//  Copyright © 2016년 david. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
///imageView Gesture
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *rootViewGesture;
///imageView
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

//gesture method
- (IBAction)alertActionSheet:(id)sender
{
    
    void(^actionHandler)(UIAlertAction * _Nonnull action) = ^(UIAlertAction * _Nonnull action)
    {
        UIImagePickerControllerSourceType pickerType = UIImagePickerControllerSourceTypePhotoLibrary;
        if ([action.title isEqualToString:@"사진앨범"])
        {
            pickerType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        } else if ([action.title isEqualToString:@"카메라"])
        {
            pickerType = UIImagePickerControllerSourceTypeCamera;
        }
        ///생각해보기
        [self showPickerControllerWith:pickerType];
    };
    
    //UIAlertController 생성
    UIAlertController *sheetAlert = [UIAlertController alertControllerWithTitle:@"사진" message:@"사진선택하기" preferredStyle:UIAlertControllerStyleActionSheet];
    
    //UIAlertAction 생성
    NSArray *actionTitle = @[@"라이브러리", @"사진앨범", @"카메라", @"취소"];
    
    for (NSString *title in actionTitle)
    {
        UIAlertActionStyle alertActionStyle = UIAlertActionStyleDefault;
        if ([title isEqualToString:@"카메라"])
        {
            alertActionStyle = UIAlertActionStyleDestructive;
            if ([UIImagePickerController ]) {
                <#statements#>
            }
        } else if ([title isEqualToString:@"취소"])
        {
            alertActionStyle = UIAlertActionStyleCancel;
        }
        
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:title style:alertActionStyle handler:actionHandler];
        
        [sheetAlert addAction:alertAction];
    }
    
    //present
    [self presentViewController:sheetAlert animated:YES completion:nil];
}

//PickerController를 보여준다
- (void)showPickerControllerWith:(UIImagePickerControllerSourceType)pickerType
{
    //imagePickerController 객체 생성
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    /*
     imagePickerController의 위임자는 viewController 사용자의 액션에 따른 처리때문에 필요로 하다
     imagePickerController는 navigationController를 상속받았고 navigationController는 UIViewController를 상속받았는데 그러면 imagePickerController에서 다 처리할 수있는 것 아닌가?
     user가 pick했다면 그사실을 viewcontroller에게 알려줘서 그에맞는 처리를 해준다
     */
    picker.delegate = self;
    //picker type정하기
    [picker setSourceType:pickerType];
    //편집모드 설정
    [picker setAllowsEditing:YES];
    //presntModal
    [self presentViewController:picker animated:YES completion:nil];
    
}

//delegateOverride
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    //편집된 이미지가 있는지 검사후 없으면 원본 검사후 없으면 없다고 예외처리
    UIImage *pickerImage = [info objectForKey:UIImagePickerControllerEditedImage];
    if (pickerImage == nil)
    {
        pickerImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    }
    if (pickerImage == nil)
    {
        NSLog(@"선택된 이미지가 없습니다");
    }
    
    //imageView 에 pickerImage 추가
    [self.imageView setImage:pickerImage];
    
    //화면에 맞게 조절
    [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.imageView setClipsToBounds:YES];
    
    //dismiss
    [self dismissViewControllerAnimated:YES completion:^{
        //show alertController
        UIAlertController *pickAlertController = [UIAlertController alertControllerWithTitle:@"사진선택" message:@"사진이 선택되었습니다." preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *pickAlertAction = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleDefault handler:nil];
        [pickAlertController addAction:pickAlertAction];
        [self presentViewController:pickAlertController animated:YES completion:nil];
    }];
}

//cancel button touch
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    //dismiss
    [self dismissViewControllerAnimated:YES completion:nil];
}

//encode
- (void)encodeRestorableStateWithCoder:(NSCoder *)coder
{
    [super encodeRestorableStateWithCoder:coder];
    [coder encodeObject:self.imageView.image forKey:@"imageView"];
}

//decode
- (void)decodeRestorableStateWithCoder:(NSCoder *)coder
{
    [super decodeRestorableStateWithCoder:coder];
    UIImage *restoreImage = [coder decodeObjectForKey:@"imageView"];
    [self.imageView setImage:restoreImage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
