//
//  AppDelegate.m
//  iOSAppDev
//
//  Created by nigelli on 2021/8/8.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "GTVideoViewController.h"
#import "GTNewsViewController.h"

@interface AppDelegate () <UITabBarControllerDelegate>

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    ViewController *vc1 = [[ViewController alloc] init];
    
    vc1.view.backgroundColor = [UIColor whiteColor];
    vc1.tabBarItem.title = @"主页";
    vc1.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/home@2x.png"];
    vc1.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/home_selected@2x.png"];
    
    GTVideoViewController *vc2 = [[GTVideoViewController alloc] init];
    
    GTNewsViewController *vc3 = [[GTNewsViewController alloc] init];
    
    UIViewController *vc4 = [[UIViewController alloc] init];
    vc4.view.backgroundColor = [UIColor greenColor];
    vc4.tabBarItem.title = @"我的";
    vc4.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/page@2x.png"];
    vc4.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/page_selected@2x.png"];
    
    tabBarController.viewControllers = @[vc1, vc2, vc3, vc4];
    tabBarController.delegate = self;
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:tabBarController];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

#pragma mark - UITabBarControllerDelegate

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    printf("点击tab\n");
}

@end
