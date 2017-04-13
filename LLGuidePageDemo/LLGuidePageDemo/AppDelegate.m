//
//  AppDelegate.m
//  LLGuidePageDemo
//
//  Created by 陈晓龙 on 17/4/13.
//  Copyright © 2017年 陈晓龙. All rights reserved.
//

#import "AppDelegate.h"
#import "LLGuidePageController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    LLGuidePageController * guidePageVC = [[LLGuidePageController alloc]initWithPageCount:5 setupCellHandler:^(LLGuidePageCell *cell, NSIndexPath *indexPath) {
        //在这里设置数据源
        cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"start_0%ld",indexPath.row]];
        [cell.finishBtn setTitle:@"点击下一步" forState:UIControlStateNormal];
    } finishBtnHandler:^(UIButton *finishBtn) {
        NSLog(@"进入下一步");
    }];
    guidePageVC.pageControl.pageIndicatorTintColor = [UIColor purpleColor];
    guidePageVC.pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
    self.window.rootViewController = guidePageVC;
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
