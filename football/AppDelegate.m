//
//  AppDelegate.m
//  football
//
//  Created by 雨停 on 2017/6/26.
//  Copyright © 2017年 yuting. All rights reserved.
//

#import "AppDelegate.h"
#import "RootTabVC.h"
#import "LoginVC.h"
#import "NavigationVC.h"
@interface AppDelegate ()<UITabBarControllerDelegate>
@property  (nonatomic,strong)  RootTabVC *rootVC;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self  setRootVC];
    return YES;
}
-(void)setRootVC{
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.rootVC=[[UIStoryboard  storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"main"];
    self.rootVC.delegate = self;
    self.window.rootViewController=self.rootVC;
    [self.window makeKeyAndVisible];
    
}
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    NSLog(@"%@",viewController.tabBarItem.title);
    
    if ([viewController.tabBarItem.title isEqualToString:@"购物车"] || [viewController.tabBarItem.title isEqualToString:@"我"]) {
        
        LoginVC * login = [[LoginVC alloc]init];
        [( NavigationVC *)tabBarController.selectedViewController presentViewController:login animated:YES completion:nil];

        NSLog(@"%@",viewController.tabBarItem.title);
        //        if (user.Auth || user.PSP_CODE) {
        //            return YES;
        //        } else {
        //            ABSLoginVC *loginVC = [[ABSLoginVC alloc]init];
        //            loginVC.hidesBottomBarWhenPushed = YES;
        //            [(ABSNavigationVC *)tabBarController.selectedViewController presentViewController:loginVC animated:YES completion:nil];
        //            return NO;
        //        }
    }
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
