//
//  AppDelegate.m
//  UIKitDynamicAnimations
//
//  Created by Admin on 29/12/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    CGRect frame = UIScreen.mainScreen.bounds;
    self.window = [[UIWindow alloc] initWithFrame:frame];
    ViewController *vc = [ViewController alloc].init;
    self.window.rootViewController = vc;
    self.window.makeKeyAndVisible;
    return YES;
}

@end
