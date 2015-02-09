//
//  alViewController.h
//  Codify
//
//  Created by Saiteja Samudrala on 8/2/14.
//  Copyright (c) 2014 Urbanoid. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface alViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextView *table;
@property (weak, nonatomic) IBOutlet UILabel *mylabel;
@property (weak, nonatomic) IBOutlet UIDatePicker *picker;
@property (strong, nonatomic) IBOutlet UIButton *setb;
@property (nonatomic) NSMutableArray * activitylist;
@property (strong, nonatomic) IBOutlet UILabel *alarmm;
@property (weak, nonatomic) IBOutlet UITextField *activityname;
@property (nonatomic) int n;
@property (weak, nonatomic) IBOutlet UILabel *no;
@property (strong, nonatomic) IBOutlet UIButton *availableb;
@property (strong, nonatomic) IBOutlet UIButton *deleteb;
@property (strong, nonatomic) IBOutlet UIButton *submitb;
@property (nonatomic) NSString * state;
@property (nonatomic) BOOL status;
@property (nonatomic) NSDictionary * diction;
- (IBAction)Submit:(id)sender;
- (IBAction)deleter:(id)sender;
- (IBAction)available:(id)sender;
-(IBAction)resign:(id)sender;
- (IBAction)setalarm:(id)sender;

    
    

@end
