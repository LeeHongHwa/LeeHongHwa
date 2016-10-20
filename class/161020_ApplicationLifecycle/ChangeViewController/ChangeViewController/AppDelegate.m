//
//  AppDelegate.m
//  ChangeViewController
//
//  Created by david on 2016. 10. 20..
//  Copyright © 2016년 david. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //UIStoryboard 변수
    UIStoryboard *firstStoryboard = nil;
    //UIViewController 변수
    UIViewController *rootViewcontroller = nil;
    
    //컨트롤
    BOOL isUserLogined = NO;
    
    if (!isUserLogined) {
        //UIStoryboard에 값 넣기
        firstStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    } else
    {   //UIStoryboard에 값 넣기
        firstStoryboard = [UIStoryboard storyboardWithName:@"Login" bundle:nil];
    }
    //UIStoryboard에있는 UIViewController를 설정
    rootViewcontroller = [firstStoryboard instantiateInitialViewController];
    
    //윈도우 객체 생성
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen]bounds]];
    //윈도우 객체에 UIViewController를 설정 밑 addsubview
    [self.window setRootViewController:rootViewcontroller];
    //윈도우를 키로 하고 화면에 보여줄것이다
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
