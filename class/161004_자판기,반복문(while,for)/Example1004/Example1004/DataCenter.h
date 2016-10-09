//
//  DataCenter.h
//  Example1004
//
//  Created by david on 2016. 10. 4..
//  Copyright © 2016년 david. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 aoaAlbum 앨범 Data
 @author 이홍화
 @version 0.1
 */
@interface DataCenter : NSObject

///aoa앨범 데이터 딕셔너리
@property NSDictionary *aoaAlbum;

/**
 앨범 제목을 가져온다
 @author 이홍화
 @version 0.1
 */
- (NSString *)getTitleWithData:(NSDictionary *)data;

/**
 song의 제목들을 가져온다
 @author 이홍화
 @version 0.1
 */
- (NSArray *)getSongTitles:(NSDictionary *)data;

/**
 songData를 담고 있는 array를 만든다
 @author 이홍화
 @version 0.1
 */
- (NSArray *)getSongDates:(NSDictionary *)data;

/**
 song제목 입력시 가사를 알려준다
 @author 이홍화
 @version 0.1
 */
- (NSString *)lyricWithData:(NSDictionary *)data name:(NSString *)name;

/**
 song제목 입력시 재생 시간을 알려준다
 @author 이홍화
 @version 0.1
 */
- (NSDate *)playTimeWithData:(NSDictionary *)data name:(NSString *)name;


@end
