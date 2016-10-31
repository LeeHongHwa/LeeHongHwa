//
//  SaveSettingLabel.m
//  ChangeFontNotification
//
//  Created by david on 2016. 10. 31..
//  Copyright © 2016년 david. All rights reserved.
//

#import "SaveSettingLabel.h"

@implementation SaveSettingLabel
/**
 스토리 보드의 객체를 생성하는 경우 (초기화를 위해 사용되는 메서드)
 NSNotificationCenter에서 noti를 받아옴 (받는이, 받았을때 하는것, 받을 noti 이름, 보내는 이)
 */
- (void)awakeFromNib
{
    [super awakeFromNib];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(changeCurrentFontSetting:)
                                                 name:DidChangeSettingNotification
                                               object:nil];
}

/**
 notification을 받았을때 하는것
 userInfo를 통해 textColor와 fontSize를 변경
 */
- (void)changeCurrentFontSetting:(NSNotification *)noti
{
    NSDictionary *fontSetting = [noti userInfo];
    self.font = [fontSetting objectForKey:UserInfoKeyLabelFontSize];
    self.textColor = [fontSetting objectForKey:UserInfoKeyLabelTextColor];
}

/**
 notification observer를 해제
 해제를 안하면 notificationCenter에서 observer를 찾아다니다가 app이 죽음
 */
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
