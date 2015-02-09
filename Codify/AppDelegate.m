//
//  AppDelegate.m
//  Codify
//
//  Created by Saiteja Samudrala on 7/3/14.
//  Copyright (c) 2014 Urbanoid. All rights reserved.
//

#import "AppDelegate.h"
#import "Activity.h"
#import "ViewController.h"
#import "alViewController.h"
#import "ActivityViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
   
    sleep(3);
    return YES;
    

}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    NSUserDefaults * defaults = [[NSUserDefaults alloc]init];

    NSDate * fireme = [NSDate date];
    [defaults setObject:fireme forKey:@"time"];
    [defaults synchronize];
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    NSLog(@"Im not crazy");
    NSUserDefaults * defaults = [[NSUserDefaults alloc]init];
    
    NSDate * fireme = [NSDate date];
    NSDateComponents *components2 = [[NSCalendar currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitDay | NSCalendarUnitMonth fromDate: fireme];
    
    
    int f = (NSInteger)[components2 day];
    
    int g = (NSInteger)[components2 month];
    int i = (NSInteger)[components2 year];
    
    
    
    
    NSDate *lasttime = [defaults objectForKey:@"time"];
    NSDateComponents *components3 = [[NSCalendar currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitDay | NSCalendarUnitMonth fromDate: lasttime];
    
    
    int v = (NSInteger)[components3 day];
    
    int d = (NSInteger)[components3 month];
    int h = (NSInteger)[components3 year];
    
    
    if(g > d || i > h || f > v ) {
        if(([defaults objectForKey:@"save2"] == nil)== false) {
            NSString * counterfake = [defaults objectForKey:@"number"];
            int counter = [counterfake intValue];
            NSString * save2 = [defaults objectForKey:@"save2"];
            NSScanner * scan = [NSScanner scannerWithString:save2];
            NSMutableArray * activities = [[NSMutableArray alloc]init];
            for (int i = 0; i < counter; i++) {
                
                Activity * activity = [[Activity alloc]init];
                NSString * activityn = [NSString stringWithFormat:@""];
                [scan scanUpToString:@"$t" intoString:&activityn];
                NSLog(@"66. %@",activityn);
                [scan scanUpToString:@"$t" intoString:nil];
                
                activity.activityname = activityn;
                activity.hours = 0;
                [activities addObject:activity];
                
                
            }
            NSString * saveme = [NSString stringWithFormat:@""];
            for(Activity * act in activities) {
                
                saveme = [saveme stringByAppendingFormat:@"%@$t",act.activityname];
                saveme = [saveme stringByAppendingFormat:@"%f$t",act.hours];
                
            }
            NSLog(@"55. %@",saveme);
            [defaults setObject: saveme  forKey:@"save2"];
            [defaults synchronize];
        }
    }

   
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    
    NSString * body = notification.alertBody;
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Reminder" message:body delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
    
    UILocalNotification * local = [[UILocalNotification alloc]init];
    local.alertBody = notification.alertBody;
    local.userInfo = notification.userInfo;
    local.fireDate = [notification.fireDate dateByAddingTimeInterval:24*60*60];
    local.repeatInterval= NSCalendarUnitWeekday;
    [[UIApplication sharedApplication]scheduleLocalNotification:local];

}




@end
