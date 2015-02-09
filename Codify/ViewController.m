//
//  ViewController.m
//  Codify
//
//  Created by Saiteja Samudrala on 7/3/14.
//  Copyright (c) 2014 Urbanoid. All rights reserved.
//

#import "ViewController.h"
#import "ActivityViewController.h"
#import "alViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
        
    [super viewDidLoad];
      
    
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"ViewWal.png"]];

    
    for (UILocalNotification *notification in [[[UIApplication sharedApplication] scheduledLocalNotifications] copy]){
        NSDictionary * dict = notification.userInfo;
        NSLog(@"%@",[dict objectForKey:@"mykey"]);
    
    }
    
                                              }
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidAppear:(BOOL)animated {
    NSUserDefaults * defaults = [[NSUserDefaults alloc]init];
    NSString * state = [defaults objectForKey:@"state"];

    
    if([state isEqualToString:@"alarmscreen"] ||[state isEqualToString:@"apressed"]) {
        [self performSegueWithIdentifier:@"alarmify" sender:self];
    }


    if([state isEqualToString:@"onactpage"] || [state isEqualToString:@"donepressed"] || [state isEqualToString:@"onactpageseriously"]) {
        [self performSegueWithIdentifier:@"identify" sender:self];
    }

    
    
}


- (IBAction)tasks:(id)sender {
    NSString * state = @"onactpage";
    NSUserDefaults * defaults = [[NSUserDefaults alloc]init];
    [defaults setObject:state forKey:@"state"];
    [defaults synchronize];
    
}

- (IBAction)alarms:(id)sender {
    NSString * state = @"alarmscreen";
    NSUserDefaults * defaults = [[NSUserDefaults alloc]init];
    [defaults setObject:state forKey:@"state"];
  [defaults synchronize];
}
@end
