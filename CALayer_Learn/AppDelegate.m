//
//  AppDelegate.m
//  CALayer_Learn
//
//  Created by zhilong.lin on 16/3/4.
//  Copyright © 2016年 zhilong.lin. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

//- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    
//    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    self.window.backgroundColor = [UIColor whiteColor];
//        MainTableViewController *vc = [MainTableViewController new];
//        vc.restorationIdentifier = NSStringFromClass([MainTableViewController class]);
//    
//    
//    
//    
////    MaskViewController *hvc = [MaskViewController new];
////    CATransactionViewController *rvc = [CATransactionViewController new];
////    UITabBarController *tabVC = [[UITabBarController alloc] init];
////    tabVC.viewControllers = @[hvc, rvc];
////    
////    tabVC.restorationIdentifier = NSStringFromClass([tabVC class]);
//    
//    self.window.rootViewController = vc;
//
//    
//    return YES;
//}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    MainTableViewController *vc = [MainTableViewController new];
    vc.restorationIdentifier = NSStringFromClass([MainTableViewController class]);
    
    

    
//    MaskViewController *hvc = [MaskViewController new];
//    CATransactionViewController *rvc = [CATransactionViewController new];
//    UITabBarController *tabVC = [[UITabBarController alloc] init];
//    tabVC.viewControllers = @[hvc, rvc];
//    
//    tabVC.restorationIdentifier = NSStringFromClass([tabVC class]);
    
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    nav.restorationIdentifier = NSStringFromClass([UINavigationController class]);
    nav.restorationClass = [nav class];
    
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
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

- (BOOL)application:(UIApplication *)application shouldSaveApplicationState:(NSCoder *)coder {
    return YES;
}

- (BOOL)application:(UIApplication *)application shouldRestoreApplicationState:(NSCoder *)coder {
    return YES;
}

- (nullable UIViewController *) application:(UIApplication *)application viewControllerWithRestorationIdentifierPath:(NSArray *)identifierComponents coder:(NSCoder *)coder {
    UIViewController *vc = [MainTableViewController new];
    vc.restorationIdentifier = [identifierComponents lastObject];
    //因为仅当该 Controller 为 UITabbarController 时, identifierComponents数组才会只有一个值
    if (identifierComponents.count == 1) {
        self.window.rootViewController = vc;
    }
    return vc;
}

@end
