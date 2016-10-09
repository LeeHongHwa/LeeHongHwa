//
//  main.m
//  Example1004
//
//  Created by david on 2016. 10. 4..
//  Copyright © 2016년 david. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ForExample.h"
#import "DataCenter.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        //곱하기
        [ForExample getMultiplication:2];
        
        //팩토리얼
        [ForExample factorial:5];
        
        //삼각수
        [ForExample triangularNum:10];
        
        //각자리수 더하기
        [ForExample addAllNum:5792];
        
        //3 6 9 게임
        [ForExample game369:3];
        
//------------------------------------------------  aoa데이터 가져오기 연습    ------------------------------------------------
        DataCenter *aoa = [[DataCenter alloc] init];
        
        aoa.aoaAlbum = @{@"album_info":@{@"title": @"Heart Attack",@"artist" : @"AOA",}, @"song_list" : @[@{
                                                                                                                        @"name":@"심쿵해", @"artist":@"AOA", @"total_play_time": @223,@"song_info":@{
                                                                                                                                @"writer":@"용감한 형제들",@"composer":@"Mr.강",@"lyrics":@"완전 반해 반해 버렸어요\n부드러운 목소리에\n반해 반해 버렸어요\n난 떨려\n(AOA Let's Go!)"}},@{@"name":@"Luv Me", @"artist":@"AOA", @"total_play_time": @252,@"song_info":@{@"writer":@"용감한 형제들",@"composer":@"JS",@"lyrics":@"Do it this do it this girl\nDo it this do it this hey\nDo it this do it this girl\n "}},@{@"name":@"한개", @"artist":@"AOA", @"total_play_time": @238,@"song_info":@{@"writer":@"용감한 형제들",@"composer":@"별들의 전쟁",@"lyrics":@"딱 하루만 더 내게 시간을 줘\n우리 내일 다시 헤어지자고\n너와 끼던 반지 한 개 아무 의미 없이 남아\n우린 아니라는 말에 세상이 끝나버릴 것만 같아\n "}}],@"producer":@"FNC엔터테인먼트",@"album_story":@"AOA 3rd Mini Album [Heart Attack] Information\n\nAOA, 이번엔 ‘섹시 스포티’다! 세 번째 미니 앨범 ‘Heart Attack’ 전격 발매\n\nAOA, 무더위 날려 버릴 상큼발랄 서머송 ‘심쿵해’로 7개월 만의 컴백\n\n"};
        
        
        //앨범 제목을 가져온다
        NSLog(@"앨범 제목 : %@",[aoa getTitleWithData:aoa.aoaAlbum]);
        
        //song의 제목을 가져온다
        for (NSString *printSongTitles in [aoa getSongTitles:aoa.aoaAlbum]) {
            NSLog(@"노래 제목 : %@",printSongTitles);
        }
        
        //song의 제목 입력시 가사를 알려준다
        NSString *lyricsString = [aoa lyricWithData:aoa.aoaAlbum name:@"심쿵해"];
        NSLog(@"노래 가사 : %@", lyricsString);
        
        //song의 제목 입력시 재생시간을 알려준다
        NSLog(@"totalPlayTime : %@",[aoa playTimeWithData:aoa.aoaAlbum name:@"심쿵해"]);
        
        

        
    }
    
    return 0;
}
