//
//  ViewController.h
//  Codify
//
//  Created by Saiteja Samudrala on 7/3/14.
//  Copyright (c) 2014 Urbanoid. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) NSMutableArray * Activitylist;
@property (nonatomic) NSString * state;
- (IBAction)tasks:(id)sender;
- (IBAction)alarms:(id)sender;
@end
