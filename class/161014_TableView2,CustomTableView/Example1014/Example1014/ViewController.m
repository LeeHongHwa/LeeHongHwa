//
//  ViewController.m
//  Example1014
//
//  Created by david on 2016. 10. 14..
//  Copyright © 2016년 david. All rights reserved.
//

#import "ViewController.h"
//tableView를 위한 델리게이트, 데이터소스
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

///동물의 섹션, 이름
@property NSArray *animalData;
///animalData의 임시데이터
@property NSMutableArray *tempAnimalData;
///테이블뷰
@property UITableView *animalView;
///편집여부
@property BOOL isEditting;
///스위치의 on,off
@property BOOL switchOn;
///스위치의 상태 저장
@property NSMutableArray *switchStatus;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //스위치의 상태
    NSArray *switchStatusTemp = @[@0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0];
    self.switchStatus = [[NSMutableArray alloc] init];
    [self.switchStatus addObjectsFromArray:switchStatusTemp];
    //편집버튼(UIBar)
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(onClickEditButton:)];
    
    //self.navigationItem은 navigation bar 이다 setRight,setLeft에 위치해라
    [self.navigationItem setRightBarButtonItem:editButton];
    
    //동물의 섹션, 이름
    self.animalData = @[
                                @{
                                    @"animal":@"사자",
                                    @"name":@[@"남사자",@"여사자"]
                                },
                                
                                @{
                                    @"animal":@"코끼리",
                                    @"name":@[@"남코끼리",@"여코끼리"]
                                },
                                
                                @{
                                    @"animal":@"표범",
                                    @"name":@[@"남표범", @"여표범"]
                                },
                                @{
                                    @"animal":@"사자",
                                    @"name":@[@"남사자",@"여사자"]
                                    },
                                
                                @{
                                    @"animal":@"코끼리",
                                    @"name":@[@"남코끼리",@"여코끼리"]
                                    },
                                
                                @{
                                    @"animal":@"표범",
                                    @"name":@[@"남표범", @"여표범"]
                                    },
                                @{
                                    @"animal":@"사자",
                                    @"name":@[@"남사자",@"여사자"]
                                    },
                                
                                @{
                                    @"animal":@"코끼리",
                                    @"name":@[@"남코끼리",@"여코끼리"]
                                    },
                                
                                @{
                                    @"animal":@"표범",
                                    @"name":@[@"남표범", @"여표범"]
                                    },
                                @{
                                    @"animal":@"사자",
                                    @"name":@[@"남사자",@"여사자"]
                                    },
                                
                                @{
                                    @"animal":@"코끼리",
                                    @"name":@[@"남코끼리",@"여코끼리"]
                                    },
                                
                                @{
                                    @"animal":@"표범",
                                    @"name":@[@"남표범", @"여표범"]
                                    }
                            ];
    
    
    //임시 데이터 저장
    self.tempAnimalData = [[NSMutableArray alloc] init];
    [self.tempAnimalData addObjectsFromArray:self.animalData];
    
    //동물tableView 생성
    self.animalView = [[UITableView alloc] initWithFrame:CGRectMake(0, 40, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    
    self.animalView.delegate = self;
    self.animalView.dataSource = self;
    [self.view addSubview:self.animalView];

}
////------------------------------------------- 연습 1 ----------------------------------------------

////섹션
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return self.animalData.count;
//}

////로우
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    NSDictionary *animal = self.animalData[section];
//    NSArray *animalName = [animal valueForKey:@"name"];
//    return animalName.count;
//}

////셀
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"animal"];
//    if(cell == nil)
//    {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"animal"];
//    }
//    NSDictionary *animal = self.animalData[indexPath.section];
//    NSArray *animalName = [animal valueForKey:@"name"];
//    cell.textLabel.text = animalName[indexPath.row];
//    
//    return cell;
//}

////셀 선택시 셀의 타이틀 반환(alert)
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    //셀에 접근하기 위해 만들어줌
//    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    
//    //alert생성
//    UIAlertController *animalNameAlert = [UIAlertController alertControllerWithTitle:@"동물이름" message:[NSString stringWithFormat:@"%@", cell.textLabel.text] preferredStyle:UIAlertControllerStyleAlert];
//    //alert버튼
//    UIAlertAction *okBtn = [UIAlertAction actionWithTitle:@"확인" style:UIAlertActionStyleCancel handler:nil];
//    //alert버튼 뷰에 표시
//    [animalNameAlert addAction:okBtn];
////무슨뜻일까??
//    [self presentViewController:animalNameAlert animated:YES completion:Nil];
//    //indexPath값에 들어온 셀을 디셀렉트 해라
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//}
////NSArray인데 NSString 타입으로 저장된 객체이여야 한다
////index list 생성
//- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView
//{
//    return @[@"ㄱ",@"ㄴ",@"ㄷ"];
//}
////------------------------------------------- 연습 2 ----------------------------------------------

//섹션
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.tempAnimalData.count;
}
//로우
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSDictionary *animalData = self.tempAnimalData[section];
    NSArray *animalName = [animalData objectForKey:@"name"];
    
    return animalName.count;
}
//셀
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    UISwitch *switchButton;
    //row가 0일때 switch cell로 재사용 한다.
    if (indexPath.row == 0)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"switch"];
        
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"switch"];
            //스위치 생성
            switchButton = [[UISwitch alloc] init];
            [switchButton addTarget:self action:@selector(valueChangedSwitch:) forControlEvents:UIControlEventValueChanged];
            //버튼에 tag값 입력
            switchButton.tag = indexPath.section;
            cell.accessoryView = switchButton;
            //tempAnimalData중 하나 저장
            NSDictionary *animalData = self.tempAnimalData[indexPath.section];
            //애니멀 이름
            NSArray *animalName = [animalData objectForKey:@"name"];
            //애니멀 이름 + indexPath.row값
            cell.textLabel.text = [[NSString stringWithFormat:@"%ld ", indexPath.row ] stringByAppendingString:animalName[indexPath.row]];
        } else if(switchButton == nil)
        {
            switchButton = (UISwitch *)cell.accessoryView;
            [switchButton setOn:[self.switchStatus[indexPath.section] boolValue]];
        }
    } else
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"animal"];
        
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"animal"];
            //tempAnimalData중 하나 저장
            NSDictionary *animalData = self.tempAnimalData[indexPath.section];
            //애니멀 이름
            NSArray *animalName = [animalData objectForKey:@"name"];
            //애니멀 이름 + indexPath.row값
            cell.textLabel.text = [[NSString stringWithFormat:@"%ld ", indexPath.row ] stringByAppendingString:animalName[indexPath.row]];
        }
    }
    return cell;
}


- (void)valuechangedRolext:(UISwitch *)sender
{
    
}
//스위치 버튼 메서드
- (void)valueChangedSwitch:(UISwitch *)sender
{
    //스위치 status 저장
    if (sender.isOn == YES)
    {
        [self.switchStatus replaceObjectAtIndex:sender.tag withObject:@1];
    }else
    {
        [self.switchStatus replaceObjectAtIndex:sender.tag withObject:@0];
    }
}

//편집 버튼 메서드(화면)
- (void)onClickEditButton:(UIBarButtonItem *)item
{
    //테이블 뷰를 에디트 모드
    if(!self.isEditting)
    {
        [self.animalView setEditing:YES animated:YES];
        self.isEditting = YES;
    } else
    {
        [self.animalView setEditing:NO animated:NO];
        self.isEditting = NO;
    }
    //tableView dataSource canEditting
    //tableView delegate EdittingStyle
    //comm
}

//편집버튼을 눌렀을때 어떤화면을 편집가능하게 보여줄까
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

//편집버튼을 눌렀을때 보여줄 화면의 스타일은 무엇인가요
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

//그 스타일에 맡게 처리?
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //뮤터블딕셔너리(하나의 섹션)
    NSMutableDictionary *tempAnimalSection = [[NSMutableDictionary alloc] init];
    tempAnimalSection = [self.tempAnimalData[indexPath.section] mutableCopy];
    
    //뮤터블어레이(이름, 삭제)
    NSMutableArray *tempAnimalName = [[NSMutableArray alloc] init];
    [tempAnimalName addObjectsFromArray:[tempAnimalSection objectForKey:@"name"]];
    [tempAnimalName removeObjectAtIndex:indexPath.row];
    
    //뮤터블딕셔너리의 밸류값 저장
    [tempAnimalSection removeObjectForKey:@"name"];
    [tempAnimalSection setObject:tempAnimalName forKey:@"name"];
    
    //뮤터블딕셔너리를 뮤터블어레이의 동일인덱스 값으로 대체
    [self.tempAnimalData replaceObjectAtIndex:indexPath.section withObject:tempAnimalSection];
    
    //indexpath.row 값을 지운다? 업데이트 해주는 느낌인것 같은데
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

//편집버튼을 눌렀을때 어떤화면을 편집가능하게 보여줄까
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

//그 스타일에 맡게 처리?
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    //뮤터블딕셔너리(시작 셀)
    NSMutableDictionary *tempSource = [[NSMutableDictionary alloc] init];
    tempSource = [self.tempAnimalData[sourceIndexPath.section] mutableCopy];
    
    //뮤터블어레이(시작 셀)
    NSMutableArray *tempSourceName = [[NSMutableArray alloc] init];
    [tempSourceName addObjectsFromArray:[tempSource objectForKey:@"name"]];
    NSString *tempSourceNameStr = tempSourceName[sourceIndexPath.row];
    NSLog(@"%@",tempSourceNameStr);
    
    //뮤터블딕셔너리(도착점 셀)
    NSMutableDictionary *tempDestination = [[NSMutableDictionary alloc] init];
    tempDestination = [self.tempAnimalData[destinationIndexPath.section] mutableCopy];
    
    //뮤터블어레이(도착점 셀)
    NSMutableArray *destinationName = [[NSMutableArray alloc] init];
    [destinationName addObjectsFromArray:[tempDestination objectForKey:@"name"]];
    NSString *destinationNameStr = destinationName[destinationIndexPath.row];
    NSLog(@"%@",destinationNameStr);
    
    //서로 교환
    [tempSourceName replaceObjectAtIndex:sourceIndexPath.row withObject:destinationNameStr];
    [destinationName replaceObjectAtIndex:destinationIndexPath.row withObject:tempSourceNameStr];
    
    [tempSource removeObjectForKey:@"name"];
    [tempSource setObject:tempSourceName forKey:@"name"];
    
    [tempDestination removeObjectForKey:@"name"];
    [tempDestination setObject:destinationName forKey:@"name"];
    
    //다시 통합
    [self.tempAnimalData replaceObjectAtIndex:sourceIndexPath.section withObject:tempSource];
    [self.tempAnimalData replaceObjectAtIndex:destinationIndexPath.section withObject:tempDestination];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
