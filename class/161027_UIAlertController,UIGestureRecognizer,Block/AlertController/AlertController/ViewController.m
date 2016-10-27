//
//  ViewController.m
//  AlertController
//
//  Created by david on 2016. 10. 27..
//  Copyright © 2016년 david. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

//alertController(styleAlert) 생성
- (IBAction)alertAction:(UIButton *)sender
{
    [self addUIAlertControllerWith:UIAlertControllerStyleAlert];
}
//alertController(ActionSheet) 생성
- (IBAction)actionSheetAction:(UIButton *)sender
{
    [self addUIAlertControllerWith:UIAlertControllerStyleActionSheet];
}
/**
 UIalertController와 3가지 종류 액션(default, destructive, cancel) 생성
 @param UIAlertActionStyle UIAlertControllerStyleAction(alert, actionSheet) 선택
 */
- (void)addUIAlertControllerWith:(UIAlertControllerStyle)UIAlertActionStyle
{
    
//    //스위치로 할 경우
//    switch (UIAlertActionStyle)
//    {
//        case UIAlertControllerStyleAlert:
//        case UIAlertControllerStyleActionSheet:
//        NSLog(@"제대로 된 스타일이 입력되었습니다");
//            break;
//        default:
//            NSLog(@"해당하는 UIAlertControllerStyle 없습니다.");
//            return;
//            break;
//    }
    
    //UIAlertControllerStyle 확인 없을시 메서드 종료
    if (UIAlertActionStyle == UIAlertControllerStyleAlert || UIAlertActionStyle == UIAlertControllerStyleActionSheet)
    {
        /*  블럭 메서드 객체
            void (^firstBlock)(UIAlertAction *) = return + block Name + Data Type
         ^(UIAlertAction * _Nonnull action) parameter Data Type + notNil + parameter Name
        */
        void (^firstBlock)(UIAlertAction *) = ^(UIAlertAction * _Nonnull action)
        {
            if ([action.title isEqualToString:@"확인"])
            {
                NSLog(@"확인");
            } else if ([action.title isEqualToString:@"파괴"])
            {
                NSLog(@"파괴");
            } else if ([action.title isEqualToString:@"취소"])
            {
                NSLog(@"취소");
            }
        };
        
        //UIAlertController 생성
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"alert message" preferredStyle:UIAlertActionStyle];
        
        //UIAlertAction 생성
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleDefault handler:firstBlock];
        UIAlertAction *destructionAction = [UIAlertAction actionWithTitle:@"파괴" style:UIAlertActionStyleDestructive handler:firstBlock];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"취소" style:UIAlertActionStyleCancel handler:firstBlock];
        
        //Action 추가
        [alert addAction:okAction];
        [alert addAction:destructionAction];
        [alert addAction:cancelAction];
        
        //화면전환
        [self presentViewController:alert animated:YES completion:
         ^{
             NSLog(@"present completion");
         }];
        
        //메서드 종료
        return;
    }
    
    NSLog(@"해당하는 UIAlertControllerStyle 없습니다.");
    
    //메서드 종료
    return;
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
