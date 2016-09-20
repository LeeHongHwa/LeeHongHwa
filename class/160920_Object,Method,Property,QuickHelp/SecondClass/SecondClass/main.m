//
//  main.m
//  SecondClass
//
//  Created by david on 2016. 9. 20..
//  Copyright © 2016년 david. All rights reserved.
//

// <> 애플이 제공해준 framework를 가져올때 쓴다.
#import <Foundation/Foundation.h>
//""우리가 만들어준 클래스
#import "Person.h"
#import "Warrior.h"
#import "Wizard.h"
#import "Doctor.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        [Person alloc];
        
        //위 코드를 작성하면 주소값을 알려줍니다.
        //[[Person alloc] init];
        
        //사람이란 클래스의 객체를 생성하고 초기화 하라 메모리 64비트 주소 때문 변수 사용 변수에는 객체의 주소가 들어간다.
        //계속해서 쓸것
        
        
        Person *me = [[Person alloc] init];
        me.name = @"이홍화";
        
        Person *you = [[Person alloc] init];
        you.name = @"상대방";
        
        Person *honghwa = [[Person alloc] init];
        honghwa.name = @"lee hong hwa";
        
        Warrior *kimlee = [[Warrior alloc] init];
        kimlee.name = @"kimlee";
        kimlee.health = @30;
        kimlee.physicalPower = @450;
        kimlee.magicalPower = @150;
        kimlee.weapon = @"자이언트 도끼";
        
        Warrior *barbarian = [[Warrior alloc] init];
        barbarian.health = @20;
        barbarian.physicalPower = @300;
        barbarian.magicalPower = @250;
        barbarian.weapon = @"창";
        
        Warrior *dragon = [[Warrior alloc] init];
        dragon.health = @40;
        dragon.physicalPower = @600;
        dragon.magicalPower = @50;
        dragon.weapon = @"용의발톱";
        
        Wizard *magician = [[Wizard alloc] init];
        magician.name = @"magician";
        magician.health = @10;
        magician.physicalPower = @150;
        magician.magicalPower = @400;
        magician.weapon = @"완드";
        
        Wizard *odin = [[Wizard alloc] init];
        odin.name = @"odin";
        odin.health = @5;
        odin.physicalPower = @75;
        odin.magicalPower = @600;
        odin.weapon = @"막대기";
        
        Wizard *gandalf = [[Wizard alloc] init];
        gandalf.name = @"gandalf";
        gandalf.health = @1;
        gandalf.physicalPower = @15;
        gandalf.magicalPower = @1000;
        gandalf.weapon = @"연필";
        
//        //체력 로그
//        NSLog(@"%@의 체력은 %@ 입니다.",gandalf.name ,gandalf.health);
//        NSLog(@"%@의 체력은 %@ 입니다.",odin.name ,odin.health);
//        NSLog(@"%@의 체력은 %@ 입니다.",magician.name ,magician.health);
//        
//        //마력 로그
//        NSLog(@"%@의 마력은 %@ 입니다.",gandalf.name ,gandalf.magicalPower);
//        NSLog(@"%@의 마력은 %@ 입니다.",odin.name ,odin.magicalPower);
//        NSLog(@"%@의 마력은 %@ 입니다.",magician.name ,magician.magicalPower);
//        
//        
//        gandalf.health = odin.health;
//        
//        NSLog(@"%@가 레벨업으로 인해 체력이 %@ 증가했습니다", gandalf.name, gandalf.health);
//        
//        NSLog(@"무기는 %@", dragon.weapon);
//        
//        [kimlee run];
//        [kimlee sturn:@"고블린"];
//        kimlee.health = @1500;
//        
//        [kimlee run];
//        
//        [magician fire];
//        
//        [magician thunder];
//        
//        [magician cold];
//        
//        [me call:@"전지현"];
//        [me call:@"정우성"];
//        
//        [me run:kimlee.health];
//        
//        
        [me runTo:@"남산"
          bySpeed:@"빨리"
             with:@"친구"];
        
        [dragon attackTo:@"고블린"
                     hit:@20
                    with:me.name];
        
        me.name = @"정우성";
        
        [dragon attackTo:@"고블린"
                     hit:@20
                    with:me.name];
        
        Doctor *mrsOh = [[Doctor alloc] init];
        mrsOh.age = @55;
        
        Wizard *harryPotter = [[Wizard alloc] init];
        harryPotter.health = @300;
        harryPotter.mana = @800;
        harryPotter.physicalPower = @5;
        harryPotter.magicalPower = @1500;
        harryPotter.name = @"harryPortter";
        
        [harryPotter windstorm:gandalf.name];
        [harryPotter magicalAttack:me.name];
        [harryPotter heal:kimlee.name];
        
        
        
    
    }
    return 0;
}
