//
//  main.m
//  Example0922
//
//  Created by david on 2016. 9. 22..
//  Copyright © 2016년 david. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Warrior.h"
#import "Wizzard.h"
#import "Bird.h"
#import "Dog.h"
#import "Cat.h"
#import "Person.h"
#import "Student.h"
#import "UniversityStudent.h"
#import "Teacher.h"

int main(int argc, const char * argv[]) {

    //워리어 객체 생성
    Warrior *jason = [[Warrior alloc] init];
    jason.health = 1000;
    jason.mana = 250;
    jason.physicalPower = 100;
    jason.magicalPower = 50;
    jason.name = @"jason";
    
    //위자드 객체 생성
    Wizzard *gandalf = [[Wizzard alloc] init];
    gandalf.health = 500;
    gandalf.mana = 1000;
    gandalf.physicalPower = 50;
    gandalf.magicalPower = 250;
    gandalf.name = @"gandalf";
    
    //사람 객체 생성
    Person *justPerson = [[Student alloc] init];
    justPerson.personName = @"장동건";
    justPerson.age = 25;
    
    //학생 객체 생성
    Student *justStudent = [[Student alloc] init];
    justStudent.personName = @"영주";
    
    //학생 객체 생성
    Student *anotherStudent = [[Student alloc] init];
    anotherStudent.personName = @"철수";
    anotherStudent.grade = 3;
    
    //대학생 객체 생성
    UniversityStudent *uniStudent = [[UniversityStudent alloc] init];
    uniStudent.personName = @"광희";
    uniStudent.major = @"컴퓨터";
    
    //선생님 객체 생성
    Teacher *computerTeacher = [[Teacher alloc] init];
    computerTeacher.personName = @"민희";
    computerTeacher.subject = @"컴퓨터";
    
    [computerTeacher teach:justStudent];
    [computerTeacher teach:anotherStudent];
    
    //사람은 학생이 아니듯 파라미터 값으로 사람클래스는 안된다
//  [computerTeacher teach:justPerson];
    
    //student 타입을 상속받은 친구들만 들어올수 있다.
    [computerTeacher teach:uniStudent];
    
    //사람은 학생이 아니듯 학생데이터 타입으로는 사람객체를 할당 받지 못한다
//  Student *test = [[Person alloc] init];
    Person *personStudent = [[Student alloc] init];
    
    //자식클래스를 부모클래스에 저장할 경우 부모클래스의 속성과 메소드만 사용 가능하다
//  personStudent.grade = 5;
    personStudent.personName = @"난 학생이면서 사람이다";
    
    //캐릭터클래스를 상속 받았기 때문에 상속 받은 클래스는 다 들어갈 수 있다
    [jason physicalAttactTo:gandalf];
    
    //재정의 override
    [justPerson eatFood:@"고등어 집밥"];
    
    //재정의 override
    [justStudent eatFood:@"제육 급식"];
    
    //재정의 override
    [uniStudent eatFood:@"대학 학식"];
    
    //새 객체 생성
    Bird *pigeon = [[Bird alloc] init];
    pigeon.name = @"pigeon";
    pigeon.cryingSound = @"\n짹짹짹짹짹짹!!!!";
    
    //개 객체 생성
    Dog *coco = [[Dog alloc] init];
    coco.name = @"coco";
    coco.cryingSound = @"\n왈왈왈왈왈!!!!!";
    
    //고양이 객체 생성
    Cat *mimi = [[Cat alloc] init];
    mimi.name = @"mimi";
    mimi.cryingSound = @"\n야아아아아아아옹";
    
    //애완동물을 입양하다.
    [anotherStudent adopt:pigeon];
    
    //재정의 override
    [coco cryAsSound:coco];
    
    //재정의 override
    [pigeon cryAsSound:pigeon];
    
    //재정의 override
    [mimi cryAsSound:mimi];
    

    return 0;
}
