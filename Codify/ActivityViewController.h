//
//  ActivityViewController.h
//  Codify
//
//  Created by Saiteja Samudrala on 7/3/14.
//  Copyright (c) 2014 Urbanoid. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/NSCoder.h>

@interface ActivityViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel * time;
@property (strong, nonatomic) IBOutlet UITextField * enteractivity;
@property (strong, nonatomic) NSMutableArray * Activitylist;
@property (strong, nonatomic) NSMutableArray * Activitylisttwenty;
@property (strong, nonatomic) IBOutlet UILabel *titleb;
@property (strong, nonatomic) IBOutlet UITextView * Instructions;
@property (strong, nonatomic) IBOutlet UITextView *table2;
@property (strong, nonatomic) NSMutableArray * activities;
@property (strong, nonatomic) IBOutlet UITextField * activity;
@property (strong, nonatomic) IBOutlet UILabel *actlabel;
@property (strong, nonatomic) IBOutlet UITextField * hours;
@property (strong, nonatomic) IBOutlet UIButton *newactivity;
@property (strong, nonatomic) IBOutlet UITextView * table;
@property (strong, nonatomic) IBOutlet UILabel *hourslabel;
@property (strong, nonatomic) NSMutableString * display;
@property (strong, nonatomic) NSMutableString * display2;
@property (strong, nonatomic) NSData * data;
@property float h;
@property float m;
@property (strong, nonatomic) IBOutlet UIButton *instructionsb;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) BOOL check;
@property int instructioncount;
@property (strong, nonatomic) IBOutlet UIButton *activitybutton;
@property (strong, nonatomic) IBOutlet UIButton *button;
@property (strong, nonatomic) IBOutlet UIButton *upgradebut;
@property (strong, nonatomic) IBOutlet UIButton * deletebut;
@property (strong, nonatomic) IBOutlet UIButton * disbut;
@property (nonatomic) NSString * state;
@property (nonatomic) BOOL password;
@property (nonatomic) BOOL repeat;
@property (strong, nonatomic) IBOutlet UIButton *hourstilldate;

-(IBAction)hourstilldate:(id)sender;
-(IBAction)hourstoday:(id)sender;
-(IBAction)plusactivity:(id)sender;
-(IBAction)tap:(id)sender;
-(IBAction)instructions:(id)sender;
-(IBAction)resign:(id)sender;
-(IBAction)upgrade:(id)sender;
-(IBAction)done:(id)sender;
- (IBAction)deleteact:(id)sender ;
@end
