//
//  alViewController.m
//  Codify
//
//  Created by Saiteja Samudrala on 8/2/14.
//  Copyright (c) 2014 Urbanoid. All rights reserved.
//

#import "alViewController.h"
#import "Activity.h"


@interface alViewController ()

@end

@implementation alViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([ segue.identifier isEqualToString: @"backtoscreen"]) {
        _state = @"homescreen";
        NSUserDefaults * defaults = [[NSUserDefaults alloc]init];
        [defaults setObject:_state forKey:@"state"];
        [defaults synchronize];
        
    }
    
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _status = true;
    NSUserDefaults * userdefaults = [[NSUserDefaults alloc]init];
    NSString * number = [userdefaults objectForKey:@"number"];

    if( ([userdefaults objectForKey:@"number"] == nil )==false) {
        if( ([userdefaults objectForKey:@"save"] == nil)==false){
    _activitylist = [NSMutableArray arrayWithCapacity:100];
         NSString * save = [userdefaults objectForKey:@"save"];
        NSLog(@"%@",save);
        NSScanner * scen = [NSScanner scannerWithString: save ];
        
    int n = [number intValue];
    
    for(int i = 0; i < n ; i++) {
    
    NSString * actname;
    NSString * acthours;
 
    Activity * newAct = [[Activity alloc]init];
   
    [scen scanUpToString:@"$t" intoString:&actname];
        [scen scanString:@"$t" intoString:nil];
        [scen scanUpToString:@"$t" intoString:&acthours];
         [scen scanString:@"$t" intoString:nil];
        float hours = [acthours floatValue];
        newAct.activityname = actname;
        newAct.hours = hours;
        [_activitylist addObject:newAct];
        NSLog(@"%@",newAct.activityname);
    }
    } else {
        
        _no.hidden = NO;
        
    }}else {
        
        _no.hidden = NO;
        
    }

   NSString * state = [userdefaults objectForKey:@"state"];
    if([state isEqualToString:@"apressed"]) {
        
        _submitb.hidden = YES;
        _availableb.hidden = YES;
        _deleteb.hidden = YES;
        _table.hidden = NO;
        _setb.hidden = NO;
        _picker.hidden = YES;
        _activityname.hidden = YES;
        _alarmm.hidden = YES;
        _mylabel.hidden = YES;
        
        NSMutableString * string = [[NSMutableString alloc]initWithCapacity:100];
        for(UILocalNotification * notif in [[[UIApplication sharedApplication]scheduledLocalNotifications]copy]) {
            
            NSDictionary * dict = [[NSDictionary alloc]init];
            dict = notif.userInfo;
            NSString * appender = [dict objectForKey:@"mykey"];
            NSDate * date = notif.fireDate;
            NSString * dateappender = [NSDateFormatter localizedStringFromDate:date dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterShortStyle];
            
            NSLog(@"%@",appender);
            [string appendFormat:@"%@ %@\n",appender,dateappender];
            
            
        }
        
        _table.text = string;

    
    
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)Submit:(id)sender {
   
    for(Activity * act in _activitylist) {
        
        NSLog(@"%@",act.activityname);
        
        if([_activityname.text caseInsensitiveCompare: act.activityname] == NSOrderedSame) {
            
            _status = false;
            NSLog(@"I was here");
            
        }
        
    }
    
    
    for(UILocalNotification *notif in [[[UIApplication sharedApplication]scheduledLocalNotifications]copy])
    {
        NSDictionary * dict = notif.userInfo;
      
        if( [_activityname.text caseInsensitiveCompare:[dict objectForKey:@"mykey"]] == NSOrderedSame) {
            NSLog(@"kjkajskdjk %@",[dict objectForKey:@"mykey"]);
        
            [[UIApplication sharedApplication]cancelLocalNotification:notif];
            
            
        
        }
    
    }
    
    
    if(_status ==false) {
        NSDate * date = _picker.date;
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitHour | NSCalendarUnitMinute fromDate: date];
    NSInteger hours = [components hour];
    NSInteger minutes = [components minute];
    NSLog(@"%ld",(long)hours);
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy MM dd hh a"];
    
    NSDate *now = [NSDate date];
    NSString *prettyDate = [formatter stringFromDate:now];
    
    
    NSLog(@"%@",prettyDate);
    NSScanner * scen = [NSScanner scannerWithString:prettyDate];
    NSString * extension = [NSString stringWithFormat:@""];
    NSString * extension2 = [NSString stringWithFormat:@""];
    NSString * extension3 = [NSString stringWithFormat:@""];
    [scen scanUpToString:@" " intoString:&extension];
    float year = [extension floatValue];
    NSLog(@"%f",year);
    [scen scanUpToString:@" " intoString:&extension2];
    float month = [extension2 floatValue];
    NSLog(@"%f",month);
    [scen scanUpToString:@" " intoString:&extension3];
    float day = [extension3 floatValue];
    NSLog(@"%f",day);
    
    NSDateComponents * dater = [[NSDateComponents alloc]init];
    [dater setDay:(NSInteger)day];
    [dater setMonth:(NSInteger) month];
    [dater setSecond:  00];
    [dater setMinute: (NSInteger)minutes];
    [dater setHour: (NSInteger)hours ];
    [dater setYear: (NSInteger)year];
    
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    [gregorian setTimeZone: [NSTimeZone defaultTimeZone]];
    NSDate *dates = [gregorian dateFromComponents:dater];
   
    NSString * whatsgoingon = [NSDateFormatter localizedStringFromDate:dates dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterShortStyle];
    NSLog(@" %@",whatsgoingon);
    NSString * body = [NSString stringWithFormat:@"Reminder! %@",_activityname.text];
    UILocalNotification * local = [[UILocalNotification alloc]init];
        if([now compare:dates]==NSOrderedAscending) {
   
        
        }
        else {
           dates = [dates dateByAddingTimeInterval:60 * 60 * 24];
            
        }
        _diction = [NSDictionary dictionaryWithObject:_activityname.text forKey:@"mykey"];
        local.fireDate = dates;
    local.alertBody = body;
    NSString * path = [[NSBundle mainBundle]pathForResource:@"myalarm" ofType:@"caf"];
    local.soundName = path;
        local.userInfo = _diction;
        local.alertAction = @"OK";
    [[UIApplication sharedApplication]scheduleLocalNotification:local];
        _status = true;
    }
    
}

- (IBAction)deleter:(id)sender {


    for(UILocalNotification * notif in [[[UIApplication sharedApplication]scheduledLocalNotifications]copy]) {
        
        NSDictionary * dictionarys = notif.userInfo;
        NSString *userinfo = [dictionarys objectForKey:@"mykey"];
        NSLog(@"%@",userinfo);
        if([userinfo caseInsensitiveCompare:_activityname.text] == NSOrderedSame) {
            
            [[UIApplication sharedApplication]cancelLocalNotification:notif];
            
        }
        
    }


}
- (IBAction)available:(id)sender {
   
    _state = @"apressed";
    NSUserDefaults * defaults = [[NSUserDefaults alloc]init];
    [defaults setObject:_state forKey:@"state"];
    [defaults synchronize];
    _submitb.hidden = YES;
    _availableb.hidden = YES;
    _deleteb.hidden = YES;
    _table.hidden = NO;
    _setb.hidden = NO;
    _picker.hidden = YES;
    _activityname.hidden = YES;
    _alarmm.hidden = YES;
    _mylabel.hidden = YES;

    NSMutableString * string = [[NSMutableString alloc]initWithCapacity:100];
    for(UILocalNotification * notif in [[[UIApplication sharedApplication]scheduledLocalNotifications]copy]) {
        
        NSDictionary * dict = [[NSDictionary alloc]init];
        dict = notif.userInfo;
        NSString * appender = [dict objectForKey:@"mykey"];
        NSDate * date = notif.fireDate;
        NSString * dateappender = [NSDateFormatter localizedStringFromDate:date dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterShortStyle];
      
        NSLog(@"%@",appender);
        [string appendFormat:@"%@ %@\n",appender,dateappender];

        
    }
    
    _table.text = string;
}

-(IBAction)resign:(id)sender {
    
    [sender resignFirstResponder];
    
}

- (IBAction)setalarm:(id)sender {

    _submitb.hidden = NO;
    _availableb.hidden = NO;
    _deleteb.hidden = NO;
    _table.hidden = YES;
    _setb.hidden = YES;
    _picker.hidden = NO;
    _activityname.hidden = NO;
    _alarmm.hidden = NO;
    _mylabel.hidden = NO;
    _state = @"alarmscreen";

}


-(void)viewDidAppear:(BOOL)animated {
    NSUserDefaults * userdefaults = [[NSUserDefaults alloc]init];
    NSString * state = [userdefaults objectForKey:@"state"];
    if([state isEqualToString:@"apressed"]) {
        
        _submitb.hidden = YES;
        _availableb.hidden = YES;
        _deleteb.hidden = YES;
        _table.hidden = NO;
        _setb.hidden = NO;
        _picker.hidden = YES;
        _activityname.hidden = YES;
        _alarmm.hidden = YES;
        _mylabel.hidden = YES;
        
        NSMutableString * string = [[NSMutableString alloc]initWithCapacity:100];
        for(UILocalNotification * notif in [[[UIApplication sharedApplication]scheduledLocalNotifications]copy]) {
            
            NSDictionary * dict = [[NSDictionary alloc]init];
            dict = notif.userInfo;
            NSString * appender = [dict objectForKey:@"mykey"];
            NSDate * date = notif.fireDate;
            NSString * dateappender = [NSDateFormatter localizedStringFromDate:date dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterShortStyle];
            
            NSLog(@"%@",appender);
            [string appendFormat:@"%@ %@\n",appender,dateappender];
            
            
        }
        
        _table.text = string;
        
        
        
    }

    
}
@end
