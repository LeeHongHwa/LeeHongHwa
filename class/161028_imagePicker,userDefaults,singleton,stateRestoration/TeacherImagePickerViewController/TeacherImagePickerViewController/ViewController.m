//
//  ViewController.m
//  TeacherImagePickerViewController
//
//  Created by david on 2016. 10. 28..
//  Copyright © 2016년 david. All rights reserved.
//

#import "ViewController.h"

//두가지의 delegate를 쓰는 이유는 ??
@interface ViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

///이미지를 보여주는 뷰
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
///이미지 정보
@property NSData *imageData;
///사용자 기본값
@property NSUserDefaults *userDefault;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //userDefault 생성
    self.userDefault = [NSUserDefaults standardUserDefaults];
    
    //NSData <- NSData
    NSData *temp = [[NSUserDefaults standardUserDefaults] objectForKey:@"currentImage"];
    
    //UIImage <- NSData
    UIImage *previousImage = [UIImage imageWithData:temp];
    
    //사용자의 기본값(이전 이미지)
    [self.imageView setImage:previousImage];
    [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.imageView setClipsToBounds:YES];
}

/**
 imageView를 tab했을때 실행될 action
 @param sender 사용자의 interaction location
 */
- (IBAction)tabGestureAction:(id)sender
{
    //alerController 객체 생성
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"사진 가져오기"
                                                                         message:@"사진을 가져올 소스 선택"
                                                                  preferredStyle:UIAlertControllerStyleActionSheet];
    //actionTitle array
    NSArray *actionTitle = @[@"사진 라이브러리", @"사진 앨범", @"카메라", @"취소"];
    
    // __unsafe_unretained 참조가 끝난뒤에도 사라진 주소값을 저장 weak가 나오기전 것
    // ARC 때문에 weak 사용 property는 기본적으로 strong
    __weak ViewController *weakSelf = self;
    
    //block(imagePickerController)
    //returnType (^blockName)(parameterTypes) = ^returnType(parameters) {...};
    void (^actionHandler)(UIAlertAction * _Nonnull action) = ^(UIAlertAction * _Nonnull action)
    {
        //sourceType setting
        UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        if ([[action title] isEqualToString:@"사진 앨범"])
        {
            sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        } else if ([[action title] isEqualToString:@"카메라"])
        {
            sourceType = UIImagePickerControllerSourceTypeCamera;
        }
        //imagePickerController create
        [weakSelf showImagePicker:sourceType];
    };
    
    //actionTitle을 통한 actionStyle setting
    for (NSString *title in actionTitle)
    {
        UIAlertActionStyle style = UIAlertActionStyleDefault;

        if ([title isEqualToString:@"취소"])
        {
            style = UIAlertActionStyleCancel;
        } else if ([title isEqualToString:@"카메라"])
        {
            // is available camera device?
            // if no -> continue;
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] == NO)
            {
                /*
                    - break문과는 조금 다르다. break문은 반복문을 아예 종료
                    - continue문은 반복을 끝내지 않는다.
                    - continue문 아래에 있는 실행해야 하는 문장들을 건너 뛰고, 다음 반복을 시작한다.
                 */
                continue;
            }
            style = UIAlertActionStyleDestructive;
        }
        //add alertAction
        UIAlertAction *action = [UIAlertAction actionWithTitle:title style:style handler:actionHandler];
        [actionSheet addAction:action];
    }
    //presnet alertController
    [self presentViewController:actionSheet animated:YES completion:nil];
}

/**
    create UIImagePickerController
    @param sourceType UIImagePickerControllerSourceType
 */
- (void)showImagePicker:(UIImagePickerControllerSourceType)sourceType
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    [picker setDelegate:self];
    [picker setSourceType:sourceType];
    [picker setAllowsEditing:YES];
    [self presentViewController:picker animated:YES completion:nil];
}

#pragma mark - UIImagePickerController Delegate

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}
//제네릭 명시적의미 <NSString *,id>
/**
    userInteraction에 따른 처리
 */
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    //편집된 이미지가 있는지 검사후 없으면 원본 검사후 없으면 없다고 예외처리
    UIImage *pickedImage = info[UIImagePickerControllerEditedImage];
    
    if (pickedImage == nil) {
        pickedImage = info[UIImagePickerControllerOriginalImage];
    }
    if (pickedImage == nil) {
        NSLog(@"사진이 없소");
        return;
    }
    
    //imageView setting
    [[self imageView] setImage:pickedImage];
    [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.imageView setClipsToBounds:YES];
    
    //dismiss setting
    [picker dismissViewControllerAnimated:YES completion:^{
        //사진을 가져왔습니다. alert 보여주기
        UIAlertController *okalertController = [UIAlertController alertControllerWithTitle:@"완료" message:@"완료되었습니다" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleDefault handler:nil];
        
        [okalertController addAction:okAction];
        [self presentViewController:okalertController animated:YES completion:nil];
    }];

    //save userDefaultTempData
    self.imageData = UIImagePNGRepresentation(pickedImage);
    //setting userDefault
    [self.userDefault setObject:self.imageData forKey:@"previousImage"];
    [self.userDefault synchronize];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
