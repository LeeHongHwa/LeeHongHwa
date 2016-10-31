//
//  FontSettingViewController.m
//  ChangeFontNotification
//
//  Created by david on 2016. 10. 31..
//  Copyright © 2016년 david. All rights reserved.
//

#import "FontSettingViewController.h"

//storyboard의 slider를 tag값으로 가져오기위해
NS_ENUM(NSInteger)
{
    tagSlideRed = 100,
    tagSlideGreen,
    tagSlideBlue
};
    
//index에 따른 처리를 위해
NS_ENUM(NSInteger)
{
    sizeSegmentIndexSmall = 0,
    sizeSegmentIndexMedium,
    sizeSegmentIndexLarge
};
    
@interface FontSettingViewController ()

///미리보기 라벨
@property (weak, nonatomic) IBOutlet UILabel *previewLabel;

@end

@implementation FontSettingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

// 강사님 naming : colorSliderValueChanged
/**
 slider value의 변화에 따른 값 변경
 */
- (IBAction)valueChangeColor:(UISlider *)sender
{
    //viewWithTag -> view dataType return
    UISlider *redColorSlider = [[self view] viewWithTag:tagSlideRed];
    UISlider *greenColorSlider = [[self view] viewWithTag:tagSlideGreen];
    UISlider *blueColorSlider = [[self view] viewWithTag:tagSlideBlue];
    
    //예외사항 체크
    if ([redColorSlider isKindOfClass:[UISlider class]] &&
        [greenColorSlider isKindOfClass:[UISlider class]] &&
        [blueColorSlider isKindOfClass:[UISlider class]] == NO)
    {
        return;
    }
    
    //색상값 설정
    CGFloat redColorValue = redColorSlider.value;
    CGFloat greenColorValue = greenColorSlider.value;
    CGFloat blueColorValue = blueColorSlider.value;
    
    UIColor *color = [UIColor colorWithRed:redColorValue
                                     green:greenColorValue
                                      blue:blueColorValue
                                     alpha:1.f];
    
    //previewLabel 텍스트 색상 지정
    self.previewLabel.textColor = color;
}

// 강사님 naming : sizeSegmentValueChanged
- (IBAction)valueChangedChangeFontSize:(UISegmentedControl *)sender
{
//____ 내코드
    
//    NSString *senderTitle = [sender titleForSegmentAtIndex:sender.selectedSegmentIndex];
//    if ([senderTitle isEqualToString:@"Small"])
//    {
//        self.previewLabel.font = [UIFont systemFontOfSize:14];
//    } else if ([senderTitle isEqualToString:@"Medium"])
//    {
//        self.previewLabel.font = [UIFont systemFontOfSize:17];
//    } else if ([senderTitle isEqualToString:@"Large"])
//    {
//        self.previewLabel.font = [UIFont systemFontOfSize:21];
//    }
    
//____ Update
    
    //UIFont 초기화
    UIFont *font = nil;
    
    //selectedIndex에 따른 처리
    switch ([sender selectedSegmentIndex])
    {
        case sizeSegmentIndexSmall:
            font = [UIFont systemFontOfSize:14];
            break;
            
        case sizeSegmentIndexMedium:
            font = [UIFont systemFontOfSize:17];
            break;
            
        case sizeSegmentIndexLarge:
            font = [UIFont systemFontOfSize:21];
            break;
    }
    
    //예외 처리
    if (font != nil)
    {
        self.previewLabel.font = font;
    }
    
}

// 강사님 naming : clickSaveButton
/**
 saveButton을 눌렀을때 postNotification
 */
- (IBAction)onClickPostNotification:(UIButton *)sender
{
    //예외사항 체크
    if (self.previewLabel == nil ||
        self.previewLabel.textColor == nil ||
        self.previewLabel.font == nil)
    {
        return;
    }
    
    //noti의 이름, 보내는이, 보내는정보(딕셔너리)
    [[NSNotificationCenter defaultCenter] postNotificationName:DidChangeSettingNotification
                                                        object:self
                                                      userInfo:@{UserInfoKeyLabelFontSize:self.previewLabel.font, UserInfoKeyLabelTextColor:self.previewLabel.textColor}];
    //navigationController 화면전환(back)
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
