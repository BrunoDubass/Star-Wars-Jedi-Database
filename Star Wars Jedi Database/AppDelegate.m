//
//  AppDelegate.m
//  Star Wars Jedi Database
//
//  Created by Bruno Domínguez on 08/01/15.
//  Copyright (c) 2015 brunodominguez. All rights reserved.
//

#import "AppDelegate.h"
#import "BDBKnightViewController.h"
#import "BDBJediTableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //CONTROLLERS
    
    BDBKnightViewController* knightVC = [[BDBKnightViewController alloc]init];
    knightVC.title = @"Create Jedi";
    
//    BDBJediTableViewController* jediTableVC = [[BDBJediTableViewController alloc]initWithStyle:UITableViewStyleGrouped];
//    jediTableVC.title = @"JEDI TABLE";
    
    //DELEGATES
    
    //knightVC.delegate = jediTableVC;
    
    //COMBINATORS
    
    UINavigationController* navVC = [[UINavigationController alloc]initWithRootViewController:knightVC];
    
    navVC.tabBarItem.image = [UIImage imageNamed:@"darth 30"];
    //jediTableVC.tabBarItem.image = [UIImage imageNamed:@"jedi table"];
    
    UITabBarController* tabBarVC = [[UITabBarController alloc]init];
    tabBarVC.viewControllers = @[navVC];
    
    //CUSTOM APPEARANCE
    
    [[UINavigationBar appearance]setBarTintColor:[UIColor blueColor]];
    [[UINavigationBar appearance]setTintColor:[UIColor yellowColor]];
    [[UINavigationBar appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    //ROOT VIEW CONTROLLER
    
    self.window.rootViewController = tabBarVC;
    self.window.backgroundColor = [UIColor whiteColor];
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

@end
