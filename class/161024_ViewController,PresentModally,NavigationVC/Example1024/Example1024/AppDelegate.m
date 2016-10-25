//
//  AppDelegate.m
//  Example1024
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


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //Main이라는 이름의 storyboard를 저장
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    //Identifier storyboard ID에 해당하는 viewController저장
    //InitialView 처음시작하는 뷰컨트롤러(화살표)
    ViewController *vc = [storyBoard instantiateInitialViewController];
    //ViewController2 *vc2 = [storyBoard instantiateViewControllerWithIdentifier:@"ViewController2"];
    
    //xib viewController 생성, 이름이 같을때는 name을 안써도 된다
    //ViewControllerXib *vcWithX = [[ViewControllerXib alloc] init];
    //ViewControllerXib *vcWith2 = [[ViewControllerXib alloc] initWithNibName:@"name" bundle:nil];
    
    //window 객체 생성및 사이즈 지정
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    //rootView 설정
    self.window.rootViewController = vc;
    
    //다시 그리다
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
