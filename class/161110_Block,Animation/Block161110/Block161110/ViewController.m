//
//  ViewController.m
//  Block161110
//
//  Created by david on 2016. 11. 10..
//  Copyright © 2016년 david. All rights reserved.
//

#import "ViewController.h"

//사용하기 쉽게 typedef로 정의
typedef NSInteger(^addNumber)(NSInteger number1, NSInteger number2);

@interface ViewController ()

///block object
@property addNumber plusNumber;
//숫자
@property NSInteger num;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testMethod];
    
    ///____제곱
    /*
    void(^squared)(NSInteger number);
    squared = ^(NSInteger number){
        NSLog(@"%ld",number * number);
    };
    
    squared(3);
     */
    
    ///____두개를 입력받아서 더한걸 NSLog
    /*
    NSInteger(^addNumber)(NSInteger number1, NSInteger number2);
    addNumber = ^(NSInteger number1, NSInteger number2){
        return number1 + number2;
    };
    NSLog(@"%ld",addNumber(5,7));
    */
    
    ///____property block
    /*
    self.addNumber = ^(NSInteger number1, NSInteger number2){
        return number1 + number2;
    };
    
    NSLog(@"%ld",self.addNumber(8,9));
     */
    
    ///____this is block
    /*
    void(^block)(void) = ^{
        NSLog(@"this is bloc");
    };
    block();
     */
    
    ///____number1 * number2
    /*
    void(^multiplyNumber)(NSInteger, NSInteger) = ^(NSInteger num1, NSInteger num2){
        NSLog(@"%ld",num1 * num2);
    };
    multiplyNumber(5,8);
     */
    
    
    ///____hi
    /*
    NSString * (^hiStr)(NSString *, NSString *) = ^(NSString *str1, NSString *str2){
        NSString *tempStr = [NSString stringWithFormat:@"%@%@", str1, str2];
        return tempStr;
    };
    NSLog(@"%@",hiStr(@"안녕", @"하세요"));
     */
    
    
    ///____복습
    /*
     //선언
     returnType(^blockName)(parameterType)
     //정의
     ^(parameterType parameterName){...};
     //편의성을 위한 typedef
     typedef returnType(^blockName)(parameterType);
     */
    
    NSInteger(^testBlock)(NSInteger number) = ^(NSInteger number){
        return number;
    };
}

- (void)testMethod
{
    //블럭 내부에서 사용하도록 __block선언
    __block NSInteger anInteger = 42;
    
    //block 내에서 property에 접근하면 self를 참조를 한다 그로인해 self의 retain count는 2가 되어 좀비객체가 될수도 있어 __weak를 사용하여 retain count를 고정한다.
    ViewController * __weak weakSelf = self;
    
    //self의 주소값을 캡쳐함
    void(^testBlock)(void) = ^{
        anInteger = 84;
        //카피가 아닌 캡쳐
        weakSelf.num = 10;
        NSLog(@"Interger is %ld %ld",anInteger, weakSelf.num);
    };
    
    testBlock();
    NSLog(@"%ld",weakSelf.num);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
