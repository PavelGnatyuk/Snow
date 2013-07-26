//
//  AppDelegate.m
//  Snow
//
//  Created by Pavel Gnatyuk on 7/26/13.
//  Copyright (c) 2013 Pavel Gnatyuk. All rights reserved.
//

#import "AppDelegate.h"

#import "SnowEmitterView.h"

@interface AppDelegate ()

@property (retain) SnowEmitterView *viewSnow;
@property (retain) UIButton *btn;
@property (assign) BOOL snowing;

@end

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    CGRect bounds = [[UIScreen mainScreen] bounds];
    UIWindow *window = [[UIWindow alloc] initWithFrame:bounds];
    SnowEmitterView *viewSnow = [[SnowEmitterView alloc] initWithFrame:bounds];
    UIViewController *controller = [[UIViewController alloc] init];
    UIView *view = [[UIView alloc] initWithFrame:bounds];
    [view setBackgroundColor:[UIColor darkGrayColor]];
    [controller setView:view];
    [view addSubview:viewSnow];
    [window setRootViewController:controller];
    [viewSnow start];

    [self setViewSnow:viewSnow];
    [self setSnowing:YES];

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setFrame:CGRectMake(CGRectGetMidX(bounds), CGRectGetMaxY(bounds) - 100, 140, 40)];
    [btn setTitle:@"Stop" forState:UIControlStateNormal];
    [[btn titleLabel] setTextColor:[UIColor darkTextColor]];
    [btn setBackgroundColor:[UIColor clearColor]];
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn];
    [self setBtn:btn];
    [btn release];
    
    [self setWindow:window];
    
    [viewSnow release];
    [view release];
    [controller release];
    [window release];
    
    [window makeKeyAndVisible];
    return YES;
}

- (void)click:(id)sender
{
    if ( [self snowing] ) {
        [[self viewSnow] stop];
        [self setSnowing:NO];
        [[self btn] setTitle:@"Start" forState:UIControlStateNormal];
    }
    else {
        [[self viewSnow] start];
        [self setSnowing:YES];
        [[self btn] setTitle:@"Stop" forState:UIControlStateNormal];
    }
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
