//
//  AppDelegate.m
//  testController
//
//  Created by david on 2016. 10. 24..
//  Copyright © 2016년 david. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "ViewController2.h"
#import "ViewControllerXib.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
/**
 window 생성, rootView 설정하는 시점
 */
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //storyboard 생성
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    //storyboard에 있는 화살표(처음 시작하는 지점)의 viewController를 Viewcontroller 객체에 저장
    ViewController2 *vc = [storyboard instantiateInitialViewController];
    //storyboard에 있는 identifier:Screen2에 있는 viewController를 ViewController 객체에 저장
//    ViewController *vc2 = [storyboard instantiateViewControllerWithIdentifier:@"Screen2"];
    //xib 활용
    //initWithNibName은 파일명과 customclass와 같다면 alloc init만하고 아니라면 nibName 설정
//    ViewControllerXib *vc3 = [[ViewControllerXib alloc] initWithNibName:@"Hello" bundle:nil];
    //window객체 생성
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc];
    //rootViewController 프로퍼티값 지정
    self.window.rootViewController = navi;
    //window를 그려줘
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
