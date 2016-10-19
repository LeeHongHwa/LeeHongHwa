//
//  MyViewController.m
//  FirstStoryboard
//
//  Created by david on 2016. 10. 17..
//  Copyright © 2016년 david. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()
//IBOutlet: 스토리보드에서 만들어 놓은 객체와 코드와의 연결
@property (weak, nonatomic) IBOutlet UIView *backgroundView;
@property (weak, nonatomic) IBOutlet UISlider *redColorSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueColorSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenColorSlider;
@property IBOutlet UILabel *firstLb;
@property IBOutlet UIButton *fristBtn;
@property IBOutlet UISegmentedControl *firstSegment;
@property IBOutlet UITextField *fristTF;
@property IBOutlet UISlider *firstSlider;
@property IBOutlet UISwitch *firstSwitch;

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.firstLb.text = @"안녕하세요";
    
    // Do any additional setup after loading the view.
}

//IBAction을 통한 스토리보드에 있는 객체에게 메서드 연결
//여러 객체들이 연결될수 있으므로 isKindOfClass를 통한 예외처리를 한다
//selectedSegmentIndex는 선택된 값을 가져온다
- (IBAction)changeFirstLb:(id)sender
{
    self.firstLb.text = @"변경";
}

- (IBAction)clickButton:(id)sender {
    if ([sender isKindOfClass:[UIButton class]])
    {
        UIButton *button = sender;
        NSLog(@"button title %@, tag %ld", [[button titleLabel] text], [button tag]);
    }else
    {
        NSLog(@"버튼이 아닙니다");
    }
}
- (IBAction)sliderValueChanged:(id)sender
{
    if ([sender isKindOfClass:[UISlider class]])
    {
        UISlider *slider = sender;
        NSLog(@"slider value :%lf",slider.value);
    }
}
- (IBAction)segmentSelectionChanged:(id)sender
{
    if ([sender isKindOfClass:[UISegmentedControl class]])
    {
        UISegmentedControl *segment = sender;
        NSLog(@"segmentValue : %ld",[segment selectedSegmentIndex]);
    }
}
- (IBAction)switchChanged:(id)sender
{
    if ([sender isKindOfClass:[UISwitch class]]) {
        UISwitch *senderSwitch = sender;
        NSLog(@"switch value : %d",[senderSwitch isOn]);
    }
}
- (IBAction)changeColor:(id)sender
{
    if ([sender isKindOfClass:[UISlider class]]) {
        //sender가 레드인지 그린인지 블루인지 의 값을 가져와야한다
        CGFloat red = self.redColorSlider.value;
        CGFloat green = self.greenColorSlider.value;
        CGFloat blue = self.blueColorSlider.value;
        
        UIColor *backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0f];
        self.backgroundView.backgroundColor = backgroundColor;
    }
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
