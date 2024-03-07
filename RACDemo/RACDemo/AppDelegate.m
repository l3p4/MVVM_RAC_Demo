//
//  AppDelegate.m
//  RACDemo
//
//  Created by simon on 2024/2/12.
//

#import "AppDelegate.h"
#import "RACDemo-Swift.h"

@interface AppDelegate ()


@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [self setupWindow];
    [self.window makeKeyAndVisible];
    [self configScrollViewAdjustSafeArea];
    
    return YES;
}

- (UIWindow *)setupWindow {
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    EntryVC *VC = [[EntryVC alloc] init];
    UINavigationController *navC = [[UINavigationController alloc] initWithRootViewController:VC];
    window.rootViewController = navC;
    return window;
}

- (void)configScrollViewAdjustSafeArea {
    // 设置全局的 contentInsetAdjustmentBehavior
    if (@available(iOS 11.0, *)) {
        [UIScrollView appearance].contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentAutomatic;
    }
}

@end
