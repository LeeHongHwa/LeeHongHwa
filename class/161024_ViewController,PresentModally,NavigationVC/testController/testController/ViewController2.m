//
//  ViewController2.m
//  testController
//
//  Created by david on 2016. 10. 24..
//  Copyright © 2016년 david. All rights reserved.
//

#import "ViewController2.h"
#import "ViewControllerXib.h"

@interface ViewController2 ()

@property (weak, nonatomic) IBOutlet UIButton *popButton;
@property (weak, nonatomic) IBOutlet UIButton *pushButton;
@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
//버튼에 pop메서드 호출 추가
- (IBAction)popAction:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
//버튼에 push메서드 호출 추가 Xib로 이동
- (IBAction)pushAction:(UIButton *)sender
{
    
    ViewControllerXib *v3 = [[ViewControllerXib alloc] initWithNibName:@"ViewControllerXib" bundle:nil];
    [self.navigationController pushViewController:v3 animated:YES];
    
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
