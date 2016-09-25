//
//  main.m
//  Example0923
//
//  Created by david on 2016. 9. 23..
//  Copyright © 2016년 david. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"
#import "AxeWarrior.h"
#import "SwordWorrior.h"
#import "FireWizzard.h"
#import "HealWizzard.h"
#import "Oak.h"


int main(int argc, const char * argv[]) {

    //Person 객체 생성
    Person *jack = [[Person alloc] init];
    jack.name = @"잭키챤";
    jack.age = 50;
    jack.mobileNumber = @"000-0000-0234";
    jack.city = @"홍콩";
    jack.isHandsome = YES;
    
    //Student 객체 생성
    Student *jason = [[Student alloc] initWithName:@"제이슨"
                                              city:@"서울"
                                        schoolName:@"서울대"
                                             grade:4
                                            credit:100];
    
    //Person 객체 init 메서드 호출 기본 프로퍼티값을 지정
    Person *rose = [[Person alloc] initWithName:@"로즈" isHandsome:YES];
    Person *mina = [[Person alloc] initWithName:@"mina" city:@"런던"];
    Person *hyejin = [[Person alloc] initWithAge:24 city:@"용인" sex:@"여자"];
    
//--------------------------------로그로 값 확인---------------------------------
    
    //이름, 나이
    NSLog(@"rose's name: %@, 잘생겼냐?: %d", rose.name, rose.isHandsome);

    //이름, 도시
    NSLog(@"mina's name: %@ city name: %@", mina.name, mina.city);
    
    //나이, 도시, 성뵬
    NSLog(@"hyejin age:%ld city:%@ sex:%@", hyejin.age, hyejin.city, hyejin.sex);
  
    NSLog(@"이름:%@ 거주지:%@ 상속/ 학교이름:%@ 학년:%ld 성적:%ld", jason.name, jason.city, jason.school, jason.grade, jason.credit);
    
//--------------------------------------게임세상-------------------------------------
   
    //AxeWarrior 객체 생성
    AxeWarrior *baba = [[AxeWarrior alloc] initWithName:@"바바리안"
                                                  level:22
                                    physicalAttackPoint:50
                                     magicalAttackPoint:20
                                                 health:200
                                                   mana:50
                                                 weapon:@"대형도끼"
                                                  armor:@"미늘갑옷"
                                             speedPoint:20
                                                 shield:@"미늘방패"];
    
    //SwordWorrior 객체 생성
    SwordWorrior *pala = [[SwordWorrior alloc] initWithName:@"팔라딘"
                                                      level:25
                                        physicalAttackPoint:40
                                         magicalAttackPoint:30
                                                     health:250
                                                       mana:100
                                                     weapon:@"소드"
                                                      armor:@"용갑옷"
                                                 speedPoint:30
                                                     shield:@"용방패"];
    
    //FireWizzard 객체 생성
    FireWizzard *sosu = [[FireWizzard alloc] initWithName:@"소서리스"
                                                    level:18
                                      physicalAttackPoint:20
                                       magicalAttackPoint:50
                                                   health:150
                                                     mana:500
                                                   weapon:@"불완드"
                                                    armor:@"불갑옷"
                                               speedPoint:150
                                               magicGrade:@"6등급"];
    
    //HealWizzard 객체 생성
    HealWizzard *heal = [[HealWizzard alloc] initWithName:@"힐러"
                                                    level:15
                                      physicalAttackPoint:20
                                       magicalAttackPoint:30
                                                   health:300
                                                     mana:500
                                                   weapon:@"힐완드"
                                                    armor:@"힐갑옷"
                                               speedPoint:100
                                               magicGrade:@"5등급"];
    
    
    //Oak 객체 생성
    Oak *hiOak = [[Oak alloc] initWithName:@"샤우팅오크"
                                     level:5
                       physicalAttackPoint:5
                        magicalAttackPoint:5
                                    health:15
                                      mana:10
                               respawnTime:30];
    
    //메서드 호출
    [baba axeAttackTo:hiOak];
    [heal physicalAttack:baba];
    [pala magicalAttack:heal];
    [sosu fireProtctTo:heal];
    
    
    return 0;
}
