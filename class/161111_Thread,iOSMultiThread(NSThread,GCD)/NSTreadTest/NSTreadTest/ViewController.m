//
//  ViewController.m
//  NSTreadTest
//
//  Created by david on 2016. 11. 11..
//  Copyright © 2016년 david. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

///초 label
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
///스탑워치 버튼
@property (weak, nonatomic) IBOutlet UIButton *countButton;

///NSThread
@property NSThread *testThread;
///초
@property NSInteger seconds;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //_____thread 객체 생성
//    self.testThread = [[NSThread alloc] initWithTarget:self
//                                              selector:@selector(checkCountLabel)
//                                                object:nil]; //object는 param
    
    
    
    //_____Thread 시작
//    [testThread start];
    
    //_____MainQueue
    //dispatch는 접두어라고 생각하면 된다.
//    dispatch_queue_t mainQueue = dispatch_get_main_queue();
//    dispatch_queue_t global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    
//    dispatch_async(mainQueue, ^{
//        NSLog(@"mainQueue hihi");
//    });
//    
//    dispatch_sync(global, ^{
//        NSLog(@"globalQueue hihi");
//    });
    
    //_____Private(DISPATCH_QUEUE_CONCURRENT)
    dispatch_queue_t concurrent_queue = dispatch_queue_create("concurrent", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(concurrent_queue, ^{
        for (NSInteger i = 0; i < 10; i++) {
            NSLog(@"1번째 일 %ld",i);
        }
    });
    dispatch_async(concurrent_queue, ^{
        NSLog(@"call 2");
    });
    dispatch_async(concurrent_queue, ^{
        for (NSInteger i = 30; i < 40; i++) {
            NSLog(@"3번째 일 %ld",i);
        }
    });
    dispatch_async(concurrent_queue, ^{
        NSLog(@"call 4");
    });
    dispatch_async(concurrent_queue, ^{
        NSLog(@"call 5");
    });
    
    //_____Private(DISPATCH_QUEUE_SERIAL)
    dispatch_queue_t serialQueue = dispatch_queue_create("com.honghwa.serialQueue", DISPATCH_QUEUE_SERIAL);
    
    //nanoseconds 입력된 이후에 메서드가 실행
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime,
                   serialQueue,
                   ^{
                       NSLog(@"에프터");
                   });
    dispatch_sync(serialQueue, ^{
        NSLog(@"시리얼 1");
    });
    dispatch_sync(serialQueue, ^{
        NSLog(@"시리얼 2");
    });
    dispatch_sync(serialQueue, ^{
        NSLog(@"시리얼 3");
    });
    
    //_____Private(DISPATCH_QUEUE_CONCURRENT)
    dispatch_queue_t barrierQueue = dispatch_queue_create("com.honghwa.barrier", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(barrierQueue, ^{
        NSLog(@"장벽 : 1");
    });
    
    dispatch_async(barrierQueue, ^{
        NSLog(@"장벽 : 2");
    });
    
    dispatch_async(barrierQueue, ^{
        NSLog(@"장벽 : 3");
    });
    
    dispatch_async(barrierQueue, ^{
        NSLog(@"장벽 : 4");
    });
    
    dispatch_async(barrierQueue, ^{
        NSLog(@"장벽 : 5");
    });
    dispatch_async(barrierQueue, ^{
        NSLog(@"장벽 : 6");
    });
    
    dispatch_async(barrierQueue, ^{
        NSLog(@"장벽 : 7");
    });
    
    dispatch_async(barrierQueue, ^{
        NSLog(@"장벽 : 8");
    });
    
    dispatch_async(barrierQueue, ^{
        NSLog(@"장벽 : 9");
    });
    //앞에 있는 갯수만큼 처리한후에 내가 시작이다
    dispatch_barrier_async(barrierQueue, ^{
        NSLog(@"_______________장벽입니다_______________");
    });
    
    dispatch_async(barrierQueue, ^{
        NSLog(@"장벽 : 10");
    });
    
    dispatch_async(barrierQueue, ^{
        NSLog(@"장벽 : 11");
    });
    
    dispatch_async(barrierQueue, ^{
        NSLog(@"장벽 : 12");
    });
    
    
    
}


//thread에서 실행할 테스트 메서드
//- (void)testNumberCheckThread
//{
//    for (NSInteger i = 0; i < 1000000; i += 1) {
//        NSLog(@"Thread : %ld",i);
//    }
//    
//}

- (void)checkCountLabel
{
    while (!self.testThread.cancelled)
    {
        //1초를 재운다
        sleep(1);
        self.seconds += 1;
        
        //mainThread에게 일을 부탁함
        [self performSelectorOnMainThread:@selector(printCount) withObject:nil waitUntilDone:nil];
    }
    self.testThread = nil;
}

- (void)printCount
{
    self.countLabel.text = [NSString stringWithFormat:@"%ld", self.seconds];
}

- (IBAction)clickCountButton:(UIButton *)sender
{
    if ([sender isKindOfClass:[UIButton class]] == NO)
    {
        return;
    }
    
    if ([sender isSelected])
    {
        [self.testThread cancel];
        sender.selected = NO;
        
    }else
    {
        self.testThread = [[NSThread alloc] initWithTarget:self
                                                  selector:@selector(checkCountLabel) object:nil];
        [self.testThread start];
        sender.selected = YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
