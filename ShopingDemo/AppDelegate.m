//
//  AppDelegate.m
//  ShopingDemo
//
//  Created by ZhipengLi on 15/11/20.
//  Copyright (c) 2015年 guozeliang. All rights reserved.
//

#import "AppDelegate.h"
#import "SRFSurfboard.h"
#import "ViewController.h"
#import "AppConfigure.h"

@interface AppDelegate ()<SRFSurfboardDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor blueColor];
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    if ([AppConfigure boolForKey:LAST_SHOW_GUIDE_APP_VERSION]) {
        //由storyboard根据myView的storyBoardID来获取我们要切换的视图
        UITabBarController *tabBarViewVC = [storyBoard instantiateViewControllerWithIdentifier:@"TabBarController"];
        self.window.rootViewController = tabBarViewVC;
    }else{
        //由storyboard根据myView的storyBoardID来获取我们要切换的视图
        SRFSurfboardViewController *surfboard = [storyBoard instantiateViewControllerWithIdentifier:@"SRFSurfboardViewController"];
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"panels" ofType:@"json"];
        NSArray *panels = [SRFSurfboardViewController panelsFromConfigurationAtPath:path];
        [surfboard setPanels:panels];
        __weak AppDelegate *weakSelf  = self;
        surfboard.delegate = weakSelf;
        surfboard.backgroundColor = [UIColor yellowColor];
        self.window.rootViewController = surfboard;
        [AppConfigure setBool:YES forKey:LAST_SHOW_GUIDE_APP_VERSION];
    }
    
    [_window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - SRFSurfboardDelegate

/** ---
 *  @name SRFSurfboardDelegate
 *  ---
 */

- (void)surfboard:(SRFSurfboardViewController *)surfboard didTapButtonAtIndexPath:(NSIndexPath *)indexPath
{
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    //由storyboard根据myView的storyBoardID来获取我们要切换的视图
    UITabBarController *tabBarViewVC = [storyBoard instantiateViewControllerWithIdentifier:@"TabBarController"];
    self.window.rootViewController = tabBarViewVC;
    [surfboard dismissViewControllerAnimated:YES completion:nil];
}

- (void)surfboard:(SRFSurfboardViewController *)surfboard didShowPanelAtIndex:(NSInteger)index
{
    NSLog(@"Index: %li", (long)index);
}


@end
