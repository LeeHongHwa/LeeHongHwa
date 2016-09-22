//
//  main.m
//  Example0921
//
//  Created by david on 2016. 9. 21..
//  Copyright © 2016년 david. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Warrior.h"
#import "Wizard.h"
#import "Cat.h"
#import "Dog.h"
#import "Bird.h"
#import "Horse.h"
#import "Mouse.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //동물 객체 생성 및 프로퍼티 set
        Cat *cat = [[Cat alloc] init];
        cat.name = @"cat";
        cat.cryingSound = @"야옹~!";
        
        Dog *dog = [[Dog alloc] init];
        dog.name = @"dog";
        dog.cryingSound = @"멍멍~!";
        
        Bird *bird = [[Bird alloc] init];
        bird.name = @"bird";
        bird.cryingSound = @"짹짹!!";
        
        Horse *horse = [[Horse alloc] init];
        horse.name = @"horse";
        horse.cryingSound = @"히이이잉~~";
        
        Mouse *mouse = [[Mouse alloc] init];
        mouse.name = @"mouse";
        mouse.cryingSound = @"찍찍";
        
        //메서드 호출
        [cat cry];
        [dog cry];
        [bird cry];
        [horse cry];
        [mouse cry];
        
//---------------------------------------------------------------------------

        //워리어 객체 생성 및 프로퍼티 set
        Warrior *jack = [[Warrior alloc] init];
        jack.health = 1000;
        jack.name = @"jack"; //[[NSString alloc] initWithUTF8String:"전사"];
        jack.mana = 50;
        jack.magicalPower = 50;
        jack.physicalPower = 250;
        
        //위자드 객체 생성 및 프로퍼티 set
        Wizard *rose = [[Wizard alloc] init];
        rose.health = 500;
        rose.name = @"rose";
        rose.mana = 1000;
        rose.magicalPower = 500;
        rose.physicalPower = 50;
        rose.healingPoint = 200;
        
        //메서드 호출
        [jack physicalAttackTo:rose];
        [jack magicalAttackTo:rose];
        [rose healSelf];
        [jack physicalAttackTo:rose];

//---------------------------------------------------------------------------
        
        // 형식지정자 - format specifier
        
        // 정수 타입 - 부호가 있는 32bit 정수타입 > 10진수 (%d) d: decimal
        // 정수 타입 - 부호가 있는 64bit 정수타입 > 10진수 (%ld) l: long
        
        NSLog(@"%ld", jack.magicalPower);
        NSLog(@"%ld", jack.physicalPower);
    
        // 정수 타입 - 부호가 없는 32bit 정수타입 > 10진수 (%u) u: unsigned
        // 정수 타입 - 부호가 없는 64bit 정수타입 > 10진수 (%lu) l: long
        
        NSLog(@"health : %lu", jack.health);
        NSLog(@"health : %lu", jack.health);
        
        // jack.health = UINT_MAX + 1;              overflow로 인해 최소 값 출력
        // jack.health = -1; //underflow            underflow로 인해 최대 값 출력
        
        // 실수 타입 - 32bit 실수 타입 (%f) f: float
        // 실수 타입 - 64bit 실수 타입 (%lf) l: long
        CGFloat someFloatValue = 101.5;
        NSLog(@"float value : %lf", someFloatValue);
        
        // 불리언은 형식지정자가 없어 정수로 취급
        NSLog(@"Boolean valie : %d", YES);
        NSLog(@"Boolean valie : %d", NO);
        
        // %를 표현하고 싶어요
        NSLog(@"공격력이 50%% 증가하였습니다");
        
        // 주소값을 보고싶어요 %@와 %p의 차이는?? 이 구간에만 로그를 찍고 싶어요
        NSLog(@"jack object : %@, memory address : %p", jack, jack);
        
        // 정수타입 (16진수) %lx x: hex
        NSLog(@"physical power(16진수) : %lx", jack.physicalPower);
        
        // 정수타입 (8진수) %lo o: octal
        NSLog(@"physical power(8진수) : %lo", jack.physicalPower);
        
        // 캐릭터 타입 %c c: character
        NSLog(@"character : %c",'a');
        
        // 줄바꿈 \n n: newline
        NSLog(@"줄을 바꿔 \n 봅시다");

        // 탭을 표현하고 싶어요 \t t: tab
        NSLog(@"사이에 탭\t을 넣어봅니다");
        
        // 응용
        NSLog(@"jack의 체력은 %lu이고, 마력은 %lu이고, \n물리공격력은 %ld, 마법공격력은 %ld입니다.", jack.health, jack.mana, jack.physicalPower, jack.magicalPower);

        
//---------------------------------------------------------------------------
        //데이터 타입
        
        // long => 64비트 부호가 있는 정수 타입
        // int => 32비트 부호가 있는 정수 타입
        // unsigned long  => 64비트 부호가 없는 정수 타입
        // unsigned int => 32비트 부호가 없는 정수 타입
        
        //불리언타입 옵션을 꺼놨는가 켜놨는가, 사용자의 값이 300보다 큰가 작은가를 알아볼때 사용한다
        BOOL isYagomHandsome = YES;
        BOOL compareResult = NO;
        
        //정수타입 value type
        
        //부호가 있는 정수타입
        NSInteger signedInteger = -100;
        NSInteger twoHundred = 200;
        
        //부호가 없는 정수타입
        NSUInteger unSignedInteger = -100;
        NSUInteger threeHundred = 300;
        
        //비교할때 데이터 타입이 다르면 요즘은 바꿔주지만 원래는 같은 데이터 타입으로 해야한다
        //참이면 1 거짓이면 0
        compareResult = (twoHundred < threeHundred);
        
        //value type 주기억장치에 두개의 저장소 생성
        NSInteger anotherNumber = twoHundred;
        anotherNumber = 1000;
        
        //reference type
        //객체형 숫자 타입 alloc해서 쓰는 애들은 *를 붙인다
        NSNumber *someNumberObject = @100; //[[NSNumber alloc] initWithInt:100];
        
        //alloc해서 생긴 저장소를 변수가 주소값을 가지고 있다
        NSNumber *anotherNumberVariable = someNumberObject;
        
        //실수형 숫자 타입
        CGFloat height = 200.3;
        CGFloat weight = 100.5;
        
        //한 글자 표현 문자 타입
        //ASCII코드 값이 들어간다.
        char someCharahcter = 'a';
        
        //문장 또는 문단을 표현 객체형 문자열
        NSString *someString = @"문자열";
        
        //id 아무 객체나 받을 수 있다.
        //주고 받는 데이터가 명확하지 않아 좋은 코드가 아니다
        //왜 주소값인데 *이 없을까?
        id anyObject = @"100";
        NSLog(@"%@", anyObject);
        //anyObject = [[NSObject alloc] init];
        
        
//---------------------------------------------------------------------------
        //TEST
        //그냥 숫자를 집어넣으면 32bit로 인식된다.
        NSLog(@"\n 1.NSUinteger : %u \n 2.NSInteger : %d \n 3.BOOL : %d \n 4.character : %c \n 5.CGFloat : %lf \n 6.NSInteger : %x 16진수 \n 7.NSInteger : %o 8진수", 20, -10, TRUE, 'c', 0.5, 20 ,20);
    }
    return 0;
}
