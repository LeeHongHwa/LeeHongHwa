//
//  DataCenter.m
//  Example1004
//
//  Created by david on 2016. 10. 4..
//  Copyright © 2016년 david. All rights reserved.
//

#import "DataCenter.h"

@implementation DataCenter
/*
 배열로 감싸져 있는건 배열로 풀고 딕셔너리로 감싸져 있는건 딕셔너리로 풀고
 NSDictionary: objectForKey 딕셔너리의 키값에 따른 value 출력
 NSArray: addObject 배열에 값추가
 for (일회용 객체 in 배열에 담긴 익덱스값 하나당 하나씩 반복해서 일회용 객체에게 저장)
 */


//앨범 제목을 가져오는 메소드
- (NSString *)getTitleWithData:(NSDictionary *)data {
    if (data != nil) {
        NSDictionary *album_info = [data objectForKey:@"album_info"];
        NSString *title = [album_info objectForKey:@"title"];
        return title;
    }
    return nil;
}

//song의 제목들을 가져오는 메소드 (string을 담는다)
- (NSArray *)getSongTitles:(NSDictionary *)data {
    
    NSMutableArray *songNames = [[NSMutableArray alloc] init];
    if (data != nil) {
        
        NSArray *song_list = [data objectForKey:@"song_list"];

        for (NSDictionary *songName in song_list) {

            [songNames addObject:[songName objectForKey:@"name"]];
        }
        
        return songNames;
    }
    return nil;
}

/*
 songData를 담고 있는 array를 만드는 메소드
 song_list 안에 딕셔너리로 된 배열이 있다.
 배열안에 있는 딕셔너리 안에 키값으로 song_info로 된 value들을 하나의 배열로 만들어야한다.
 */
- (NSArray *)getSongDates:(NSDictionary *)data {
    
    NSMutableArray *song_infos = [[NSMutableArray alloc] init];
    
    if (data != nil) {
        
        NSArray *song_list = [data objectForKey:@"song_list"];
        
        for (NSDictionary *song_info in song_list) {
            [song_infos addObject:[song_info objectForKey:@"song_info"]];
        }
        
        return song_infos;
    }
    return nil;
}

//song제목 입력시 가사를 알려주는 메소드
- (NSString *)lyricWithData:(NSDictionary *)data name:(NSString *)name {
    
    if (data != nil) {
        
        NSArray *song_list = [data objectForKey:@"song_list"];
        
        for (NSDictionary *song_listD in song_list) {
            
            if ([name isEqualToString:[song_listD objectForKey:@"name"]]) {
                
                NSDictionary *iricWithData = [song_listD objectForKey:@"song_info"];
                
                NSString *songLyrics = [iricWithData objectForKey:@"lyrics"];
                
                return songLyrics;
                
            }
        }
    }
    NSLog(@"제목에 해당하는 가사가 없습니다.");
    return nil;
}

//song제목 입력시 재생 시간을 알려주는 메소드
- (NSDate *)playTimeWithData:(NSDictionary *)data name:(NSString *)name {

    if (data != nil) {

        NSArray *song_list = [data objectForKey:@"song_list"];

        for (NSDictionary *total_play_time in song_list) {
            
            if ([name isEqualToString: [total_play_time objectForKey:@"name"]]) {
                
                NSDate *totalPlayTime = [total_play_time objectForKey:@"total_play_time"];
                
                return totalPlayTime;
            }
        }
    }
    NSLog(@"제목에 해당하는 노래 시간이 없습니다.");
    return 0;
}

@end
