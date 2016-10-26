//
//  AppDelegate.m
//  Homework1025
//
//  Created by david on 2016. 10. 25..
//  Copyright © 2016년 david. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "ViewController2.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //스토리보드 객체 생성
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    //viewController 객체 생성
    ViewController *v1 = [storyboard instantiateInitialViewController];
    ViewController2 *v2 = [storyboard instantiateViewControllerWithIdentifier:@"v2"];
    
    //UINavigationController 객체 생성 및 RootView 지정
    UINavigationController *navigationVC = [[UINavigationController alloc] initWithRootViewController:v2];
    
    //tabBarController 객체 생성
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    //관리할 viewControllers NSArray로 지정
    tabBarController.viewControllers = @[v1,navigationVC];
    
    //UITabBarItem Custom
    UITabBarItem *customBarButton = [[UITabBarItem alloc] initWithTitle:@"person" image:[UIImage imageNamed:@"person"] tag:0];
    UITabBarItem *systemBarButton = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:0];
    
    //해당 viewController.tabBarItem에 값 지정
    v1.tabBarItem = customBarButton;
    navigationVC.tabBarItem = systemBarButton;
    
    //윈도우 property 설정
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    //윈도우 객체의 rootViewController설정
    [self.window setRootViewController:tabBarController];
    
    //윈도우 그리기
    [self.window makeKeyWindow];
    
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
