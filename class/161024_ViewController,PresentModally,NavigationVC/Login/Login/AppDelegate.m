//
//  AppDelegate.m
//  Login
//
//  Created by david on 2016. 10. 24..
//  Copyright © 2016년 david. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "SignupViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

/**
 window가 만들어지는 시점
 */
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //storyboard 생성
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    //storyboard에 있는 storyboard ID가 login인 viewController를 ViewController 객체에 저장
    ViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"login"];
    //appDelegate의 window 객체 생성
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    //uinavigationContorller 객체 생성 및 rootViewController 지정
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:loginViewController];
    //window의 rootViewController 지정, @property navigationController 지정
    self.window.rootViewController = navi;
    
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
