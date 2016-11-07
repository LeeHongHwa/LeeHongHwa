//
//  ViewController.m
//  ValueObserving
//
//  Created by david on 2016. 11. 7..
//  Copyright © 2016년 david. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

///버튼을 누른 숫자를 표시하는 라벨
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;  //강사님 countLabel
///성 라벨
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
///이름 라벨
@property (weak, nonatomic) IBOutlet UITextField *firsNameTextField;
///성
@property NSString *firstName;
///이름
@property NSString *lastName;

//readoonly로 보기 값들을 헤더부분에 정의하면 이상하잖어
///성 + 이름
@property (readonly)NSString *fullName;

///버튼 누른 숫자
@property NSInteger checkNumber;    //강사님 count

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.numberLabel.text = @"0";
    self.checkNumber = 0;
    
    [self addObserver:self
           forKeyPath:@"checkNumber" 
              options: // NSKeyValueObservingOptionInitial | //초기값
              NSKeyValueObservingOptionNew     //변화된 값
//              NSKeyValueObservingOptionOld |    //변화되기 전 값
//              NSKeyValueObservingOptionPrior    //변화하기 전에 호출 new가 없다
              context:nil];
    
    [self addObserver:self
           forKeyPath:@"lastName"
              options:NSKeyValueObservingOptionNew  //변화된 값
              context:nil];
    
}

//변화가 감지되면 이 메서드를 실행해라
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context
{
    //dataType을 확인할 때 사용
//    id chnageNewValue = [change objectForKey:NSKeyValueChangeNewKey];
//    NSLog(@"%@",[chnageNewValue class]);
    
    if ([keyPath isEqualToString:@"checkNumber"])
    {
        self.numberLabel.text = [NSString stringWithFormat:@"%@",[change objectForKey:NSKeyValueChangeNewKey]];
    } else if ([keyPath isEqualToString:@"lastName"])
    {
        id chnageNewValue = [change objectForKey:NSKeyValueChangeNewKey];
        NSLog(@"%@",[chnageNewValue class]);
    }
    
    
}

//clickButton
- (IBAction)touchNumberButton:(UIButton *)sender
{
    //유효성검사 필요 sender에 UIGestureRecognizer도 들어갈 수 있다
    if ([sender isKindOfClass:[UIButton class]] == NO)
    {
        return;
    }
    
//내 방법 (if)
//    if (sender.tag == 0)
//    {
//        self.checkNumber += 1;
//    } else if (sender.tag == 1)
//    {
//        self.checkNumber -= 1;
//    } else if (sender.tag == 2)
//    {
//        self.checkNumber *= 2;
//    } else if (sender.tag == 3)
//    {
//        self.checkNumber /= 2;
//    }

//내 방법 (switch)
    switch (sender.tag) {
        case 0:
            self.checkNumber += 1;
            break;
            
        case 1:
            self.checkNumber -= 1;
            break;
            
        case 2:
            self.checkNumber *= 2;
            break;
            
        case 3:
            self.checkNumber /= 2;
            break;

    }
//다른 방법(여러군데에서 사용한다면 static이 좋은 방법이다.)
//    static NSInteger count = 0;
//    count += 1;
    
}

/** 프린트 버튼 클릭
 *  성 + 이름을 출력
 */
- (IBAction)clickPrintButton:(UIButton *)sender
{
    self.lastName = _lastNameTextField.text;
    self.firstName = _firsNameTextField.text;
    
//  nil값이 라면 안된다 그래서 stringWithFormat 사용
//  self.fullName = [_lastName stringByAppendingString:_firstName];
    NSLog(@"입력하신 이름은 : %@ 입니다",self.fullName);
}

/** getter fullName override
 */
- (NSString *)fullName
{
    return [NSString stringWithFormat:@"%@%@" ,_lastName, _firstName];
}

- (void)dealloc
{
    //계속해서 noti해주려고 하다가 앱이 NSException?
    [self removeObserver:self forKeyPath:@"checkNumber"];
    [self removeObserver:self forKeyPath:@"lastName"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
