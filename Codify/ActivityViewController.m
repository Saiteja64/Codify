//
//  ActivityViewController.m
//  Codify
//
//  Created by Saiteja Samudrala on 7/3/14.
//  Copyright (c) 2014 Urbanoid. All rights reserved.
//


#import "ActivityViewController.h"
#import "Activity.h"



@interface ActivityViewController ()

@end

@implementation ActivityViewController

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([ segue.identifier isEqualToString: @"alarmi"]) {
        _state = @"homescreen";
        NSUserDefaults * defaults = [[NSUserDefaults alloc]init];
        [defaults setObject:_state forKey:@"state"];
        [defaults synchronize];
    
    }
    
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSUserDefaults * userdefaults = [[NSUserDefaults alloc]init];
  
    _repeat = false;
    
    _check = true;
        _Activitylist = [NSMutableArray arrayWithCapacity:20];
    _Activitylisttwenty = [NSMutableArray arrayWithCapacity:20];
	_instructioncount = 0;
    _display = [[NSMutableString alloc]initWithCapacity:100];
    _h = 0;
     self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"chutney.png"]];
    _password = true;
   
   
      if(([userdefaults objectForKey:@"save"] == nil)==false) {
        
        
        NSUserDefaults * userdefaults = [[NSUserDefaults alloc]init];
        NSString * number = [userdefaults objectForKey:@"number"];
        
        if( ([userdefaults objectForKey:@"number"] == nil)==false) {
            if( ([userdefaults objectForKey:@"save"] == nil)==false){
           
                
                _Activitylist = [NSMutableArray arrayWithCapacity:100];
                 _Activitylisttwenty = [NSMutableArray arrayWithCapacity:100];
                NSString * save = [userdefaults objectForKey:@"save"];
                 NSString * save2 = [userdefaults objectForKey:@"save2"];
                NSLog(@"24.%@",save);
                NSScanner * scen = [NSScanner scannerWithString: save ];
                 NSScanner * scan = [NSScanner scannerWithString: save2 ];
                
                int n = [number intValue];
                NSLog(@"25.%d",n);
                for(int i = 0; i < n ; i++) {
                    
                    NSString * actname;
                    NSString * acthours;
                    NSString * actname2;
                    NSString * acthours2;
                    
                    Activity * newAct = [[Activity alloc]init];
                      Activity * Actor = [[Activity alloc]init];
                    
                    [scen scanUpToString:@"$t" intoString:&actname];
                    [scen scanString:@"$t" intoString:nil];
                    [scen scanUpToString:@"$t" intoString:&acthours];
                    [scen scanString:@"$t" intoString:nil];
                    [scan scanUpToString:@"$t" intoString:&actname2];
                    [scan scanString:@"$t" intoString:nil];
                    [scan scanUpToString:@"$t" intoString:&acthours2];
                    [scan scanString:@"$t" intoString:nil];
                    NSLog(@"1.%@",acthours);
                    float hours = [acthours floatValue];
                     float hours2 = [acthours2 floatValue];
                    newAct.activityname = actname;
                    newAct.hours = hours;
                    Actor.activityname = actname2;
                    Actor.hours = hours2;
                    NSLog(@"2.%@",newAct.activityname);
                    [_Activitylist addObject:newAct];
                    [_Activitylisttwenty addObject:Actor];
              
                    
                }
                
                
               
                self.view.backgroundColor = [[UIColor alloc ]initWithPatternImage:[UIImage imageNamed:@"rutgers.png"]];
                
                _time.hidden = NO;
                _activity.hidden = NO;
                _hours.hidden = NO;
                _enteractivity.hidden = YES;
                _button.hidden = YES;
                _table.hidden = NO;
                _upgradebut.hidden = NO;
                _instructionsb.hidden = YES;
                _activitybutton.hidden = YES;
                _actlabel.hidden = NO;
                _hourslabel.hidden = NO;
                _titleb.hidden = YES;
                _newactivity.hidden = NO;
                _deletebut.hidden = YES;
                _disbut.hidden = NO;
                
                
                
            
            }
        
        
        }
        
    }

    if((_Activitylist == nil)==false) {
        
        Activity * act = [[Activity alloc]init];
        Activity * act2 = [[Activity alloc]init];
        for (int b =0; b < [_Activitylist count]; b++ ) {
            if(b==0){
                _display = nil;
                _display2 = nil;
                _display = [[NSMutableString alloc]initWithCapacity:100];
                _display2 = [[NSMutableString alloc]initWithCapacity:100];
            }
            
            act = [_Activitylist objectAtIndex:b];
            act2 = [_Activitylisttwenty objectAtIndex:b];
            [_display appendFormat: @" %@ ",act.activityname];
            [_display2 appendFormat: @" %@ ",act2.activityname];
            [_display appendFormat: @"   %.1f hours \n",act.hours];
            [_display2 appendFormat: @"   %.1f hours \n",act2.hours];
            NSLog(@"3. %@ %@  %f", _display, act.activityname, act.hours);
            NSLog(@"4. %@", _display);
        }
        _table.text = _display;
        
        _table2.text = _display2;
        
        

   
    
    
    
    }

    
    
}


-(IBAction)tap:(id)sender {
    for( Activity * act in _Activitylist) {
        
        
        if([_enteractivity.text caseInsensitiveCompare: act.activityname] == NSOrderedSame) {
            
            _repeat = true;
            
        }
    }
    
    if(_repeat == false) {
    if(([_enteractivity.text caseInsensitiveCompare:@""]==NSOrderedSame)==false) {
        if([_Activitylist count] ==0 ) {
            _password = false;
            
            
        }
        NSString * temp;
   
    Activity * newAct = [[Activity alloc]init];
   temp =  _enteractivity.text ;
    newAct.activityname = temp;
    newAct.hours = 0;

    [_Activitylist addObject:newAct];
        [ _Activitylisttwenty addObject:newAct];
        NSLog(@"password");
        if(_password == false) {
            _m = 1;
            NSUserDefaults * defaults = [[NSUserDefaults alloc]init];
            NSString * number = [NSString stringWithFormat:@"%f",_m];
            [defaults setObject:number forKey:@"number"];
            [defaults synchronize];
            NSString * save = [NSString stringWithFormat:@"%@$t%f$t",newAct.activityname,newAct.hours];
        NSUserDefaults * userdefaults = [[NSUserDefaults alloc]init];
        [userdefaults setObject:save forKey:@"save"];
             [userdefaults setObject:save forKey:@"save2"];
        [userdefaults synchronize];
        } else {
            
            _m = [_Activitylist count];

            NSUserDefaults * defaults = [[NSUserDefaults alloc]init];
            NSString * number = [NSString stringWithFormat:@"%f",_m];
            [defaults setObject:number forKey:@"number"];
            [defaults synchronize];
            NSUserDefaults * userdefaults = [[NSUserDefaults alloc]init];
           NSString * save = [userdefaults objectForKey:@"save"];
             NSString * save2 = [userdefaults objectForKey:@"save2"];
            save = [save stringByAppendingFormat:@" %@$t%f$t", newAct.activityname, newAct.hours];
             save2 = [save2 stringByAppendingFormat:@" %@$t%f$t", newAct.activityname, newAct.hours];
            [userdefaults setObject:save forKey:@"save"];
             [userdefaults setObject:save2 forKey:@"save2"];
            [userdefaults synchronize];
        }
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy MM dd hh a"];
    
NSDate *now = [NSDate date];
    NSString *prettyDate = [formatter stringFromDate:now];
   
        
        NSLog(@"5.%@",prettyDate);
    NSScanner * scen = [NSScanner scannerWithString:prettyDate];
    NSString * material = [NSString stringWithFormat:@""];
    NSString * extension = [NSString stringWithFormat:@""];
     NSString * extension2 = [NSString stringWithFormat:@""];
      NSString * extension3 = [NSString stringWithFormat:@""];
    [scen scanUpToString:@" " intoString:&extension];
    float year = [extension floatValue];
    NSLog(@"6.%f",year);
    [scen scanUpToString:@" " intoString:&extension2];
    float month = [extension2 floatValue];
      NSLog(@"7.%f",month);
    [scen scanUpToString:@" " intoString:&extension3];
    float day = [extension3 floatValue];
     NSLog(@"8.%f",day);
    [scen scanUpToString:@" " intoString:&material];
    float h = [material floatValue];
    NSLog(@"9.%f",h);
    UILocalNotification * local = [[UILocalNotification alloc]init];
    NSString * body = [NSString stringWithFormat:@"Reminder! %@", newAct.activityname];
    [local setAlertBody:body];
        [local setAlertAction:@"OK"];
        local.repeatInterval = NSWeekdayCalendarUnit;
    [scen scanUpToString:@"PM" intoString:nil];
   
        if([scen isAtEnd]) {
     
        h = 2;
        
    }
        if(h < 5) {
        NSDateComponents * dater = [[NSDateComponents alloc]init];
        [dater setDay:(NSInteger)day];
        [dater setMonth:(NSInteger) month];
        [dater setSecond:  00];
        [dater setMinute: 00];
        [dater setHour:  17];
        [dater setYear: (NSInteger)year];
         
            NSCalendar *gregorian = [[NSCalendar alloc]
                                     initWithCalendarIdentifier:NSGregorianCalendar];
            [gregorian setTimeZone: [NSTimeZone defaultTimeZone]];
            NSDate *dates = [gregorian dateFromComponents:dater];
            [local setFireDate:dates];
            [local setAlertAction:@"OK"];
            NSLog(@"10.%@ swig",dates);
           
            NSString *dateString = [NSDateFormatter localizedStringFromDate:dates
                                                                  dateStyle:NSDateFormatterShortStyle
                                                                  timeStyle:NSDateFormatterFullStyle];
            NSLog(@"11.%@",dateString);
            NSDictionary * userInfo = [NSDictionary dictionaryWithObject:temp forKey:  @"mykey"] ;
    
            local.userInfo = userInfo;
             NSLog(@"12.this is the key%@",[local.userInfo objectForKey:@"mykey"]);
            local.soundName = UILocalNotificationDefaultSoundName;
            [[UIApplication sharedApplication]scheduleLocalNotification:local];
        } else {
            
            NSDateComponents * dater = [[NSDateComponents alloc]init];
            [dater setDay:(NSInteger)day];
            [dater setMonth:(NSInteger) month];
            [dater setSecond:  00];
            [dater setMinute:  00];
            [dater setHour:  17];
            [dater setYear: (NSInteger)year];
            
            NSCalendar *gregorian = [[NSCalendar alloc]
                                     initWithCalendarIdentifier:NSGregorianCalendar];
           
            NSDate *dates = [gregorian dateFromComponents:dater];
           NSDate *newDate1 = [dates dateByAddingTimeInterval:60*60*24];
            [local setFireDate:newDate1];
            [local setAlertAction:@"OK"];
            NSLog(@"13.%@ swig",dates);
            
            NSString *dateString = [NSDateFormatter localizedStringFromDate:dates
                                                                  dateStyle:NSDateFormatterShortStyle
                                                                  timeStyle:NSDateFormatterFullStyle];
            NSLog(@"14.%@",dateString);
            NSDictionary * userInfo = [NSDictionary dictionaryWithObject:temp forKey:@"mykey"];
            NSLog(@"15.this is the ket%@",[userInfo objectForKey:@"mykey"]);
            local.userInfo = userInfo;
         local.repeatInterval = NSWeekdayCalendarUnit;
            [[UIApplication sharedApplication]scheduleLocalNotification:local];
    
            
            
        }
    
    }}

    _repeat = false;
    _password = true;
}
 
-(IBAction)done:(id)sender {
    self.view.backgroundColor = [[UIColor alloc ]initWithPatternImage:[UIImage imageNamed:@"rutgers.png"]];
    
    _time.hidden = NO;
    _activity.hidden = NO;
    _hours.hidden = NO;
    _enteractivity.hidden = YES;
    _button.hidden = YES;
    _table.hidden = NO;
    _upgradebut.hidden = NO;
    _instructionsb.hidden = YES;
    _activitybutton.hidden = YES;
    _actlabel.hidden = NO;
    _hourslabel.hidden = NO;
    _titleb.hidden = YES;
    _newactivity.hidden = NO;
    _deletebut.hidden = YES;
    _disbut.hidden = NO;
    _state = @"donepressed";
    NSUserDefaults * defaults = [[NSUserDefaults alloc]init];
    [defaults setObject:_state forKey:@"state"];
    [defaults synchronize];
    
    if((_Activitylist == nil)==false) {
        
        Activity * act = [[Activity alloc]init];
        Activity * act2 = [[Activity alloc]init];
        for (int b =0; b < [_Activitylist count]; b++ ) {
            if(b==0){
                _display = nil;
                _display2 = nil;
                _display = [[NSMutableString alloc]initWithCapacity:100];
                _display2 = [[NSMutableString alloc]initWithCapacity:100];
            }
            
            act = [_Activitylist objectAtIndex:b];
            act2 = [_Activitylisttwenty objectAtIndex:b];
            [_display appendFormat: @" %@ ",act.activityname];
            [_display2 appendFormat: @" %@ ",act2.activityname];
            [_display appendFormat: @"   %.1f hours \n",act.hours];
            [_display2 appendFormat: @"   %.1f hours \n",act2.hours];
            NSLog(@"16. %@ %@  %f", _display, act.activityname, act.hours);
            NSLog(@"17. %@", _display);
        }
        _table.text = _display;
        
        _table2.text = _display2;
        
    }
    
}
    
  
    

-(IBAction)instructions:(id)sender {
 
   

     if(_instructioncount == 1) {
    
        _Instructions.hidden = YES ;
         _instructioncount = 0;
         [_instructionsb setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

         
     }

   else {
        
        _Instructions.hidden = NO ;
        
        _instructioncount++;
        NSLog(@"18. %d",_instructioncount);
       
       [_instructionsb setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    
    

}

-(IBAction)resign:(id)sender {
    
    [sender resignFirstResponder];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)upgrade:(id)sender{

    
    
    for (int i =0; i < [_Activitylist count]; i++ ) {
        Activity * myact = [[Activity alloc]init];
        Activity * tempact = [[Activity alloc]init];
        Activity * tempact2 = [[Activity alloc]init];
        Activity * myact2 = [[Activity alloc]init];
        
        tempact = [_Activitylist objectAtIndex:i];
        tempact2 = [_Activitylisttwenty objectAtIndex:i];
        
        if ([_activity.text caseInsensitiveCompare: tempact.activityname] == NSOrderedSame) {
            myact2 = [_Activitylisttwenty objectAtIndex:i];
            myact = [_Activitylist objectAtIndex:i];
            _h = [_hours.text floatValue];
            float c = myact.hours + _h;
             float d = myact2.hours + _h;
            myact.hours = c;
            myact2.hours = d;
            NSLog(@"19. \n %f ", myact.hours);
           
            [_Activitylist replaceObjectAtIndex:i withObject:myact];
              [_Activitylisttwenty replaceObjectAtIndex:i withObject:myact2];
           
            break;
        }
        
        
    }
    Activity * act = [[Activity alloc]init];
      Activity * act2 = [[Activity alloc]init];
    for (int b =0; b < [_Activitylist count]; b++ ) {
        if(b==0){
        _display = nil;
            _display2 = nil;
        _display = [[NSMutableString alloc]initWithCapacity:100];
            _display2 = [[NSMutableString alloc]initWithCapacity:100];
        }
        
        act = [_Activitylist objectAtIndex:b];
        act2 = [_Activitylisttwenty objectAtIndex:b];
     [_display appendFormat: @" %@ ",act.activityname];
        [_display2 appendFormat: @" %@ ",act2.activityname];
    [_display appendFormat: @"   %.1f hours \n",act.hours];
         [_display2 appendFormat: @"   %.1f hours \n",act2.hours];
     NSLog(@"20. %@ %@  %f", _display, act.activityname, act.hours);
        NSLog(@"21. %@", _display);
           }
   _table.text = _display;
   
    

    _table2.text = _display2;
    
  
    NSUserDefaults * defaults = [[NSUserDefaults alloc]init];
    NSString * muteme = [NSString stringWithFormat:@""];
     NSString * muteme2 = [NSString stringWithFormat:@""];
    for(Activity * act in _Activitylist) {
        
        muteme = [muteme stringByAppendingFormat:@"%@$t%f$t ",act.activityname,act.hours];
    
        
    }
    
     for(Activity * act in _Activitylisttwenty) {
         
          muteme2 = [muteme2 stringByAppendingFormat:@"%@$t%f$t ",act.activityname,act.hours];
         
     }
    
    [defaults setObject:muteme forKey:@"save"];
        [defaults setObject:muteme2 forKey:@"save2"];
    [defaults synchronize];
    for (UILocalNotification * notif in [[[UIApplication sharedApplication]scheduledLocalNotifications]copy]) {
        
        NSDictionary * notify = notif.userInfo;
      
        if ([_activity.text isEqualToString: [notify objectForKey:@"mykey"]] ) {
            NSDate * fireme = [NSDate date];
 NSDateComponents *components2 = [[NSCalendar currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitDay | NSCalendarUnitMonth fromDate: fireme];
            
          
            int f = (NSInteger)[components2 day];
            
            int g = (NSInteger)[components2 month];
            int h = (NSInteger)[components2 year];
        NSDate * thedate = notif.fireDate;
        
            NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitDay | NSCalendarUnitMonth fromDate: thedate];
          
            NSInteger monthj = [components month];
            NSInteger yearsj = [components year];
            NSInteger dayj = [components day];
            
            int mj = (NSInteger)monthj;
            int yj = (NSInteger)yearsj;
             int dj = (NSInteger)dayj;
            NSLog(@"22.%d",mj);
            NSLog(@"23.5 %d",g);
            
            if(mj > g || dj > f || yj >h) {
                
                
                
            } else {
            
            NSDictionary * mydiction = notif.userInfo;
            NSString * string = notif.alertBody;
            NSDate * therealdate = [thedate dateByAddingTimeInterval:60*60*24];
            [[UIApplication sharedApplication]cancelLocalNotification:notif];
            
            UILocalNotification * mytif = [[UILocalNotification alloc]init];
            mytif.alertBody = string;
            mytif.fireDate = therealdate;
                NSString * stringz = [NSDateFormatter localizedStringFromDate:therealdate dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterShortStyle];
                NSLog(@"stringz %@",stringz);
            mytif.repeatInterval = NSWeekdayCalendarUnit;
            mytif.userInfo = mydiction;
                mytif.alertAction = @"OK";
            [[UIApplication sharedApplication]scheduleLocalNotification:mytif];
            }
        
        }
    
    }
}

- (IBAction)hourstilldate:(id)sender {
    _table.hidden = NO;
    _table2.hidden = YES;
    _hourstilldate.hidden = YES;
     _disbut.hidden = NO;
}

- (IBAction)hourstoday:(id)sender {

    _table.hidden = YES;
    _table2.hidden = NO;
    _disbut.hidden = YES;
    _hourstilldate.hidden = NO;
 
    
}

-(IBAction)plusactivity:(id)sender {
    self.view.backgroundColor = [[UIColor alloc]initWithPatternImage:[UIImage imageNamed:@"chutney.png"]];
    _time.hidden = YES;
    _activity.hidden = YES;
    _hours.hidden = YES;
    _enteractivity.hidden = NO;
    _button.hidden = NO;
   _table.hidden = YES;
    _upgradebut.hidden = YES;
    _instructionsb.hidden = NO;
    _activitybutton.hidden = NO;
    _actlabel.hidden = YES;
    _hourslabel.hidden = YES;
    _titleb.hidden = NO;
    _newactivity.hidden = YES;
    _deletebut.hidden = NO;
    _disbut.hidden = YES;
    _hourstilldate.hidden = YES;
    _table2.hidden = YES;
    _state = @"onactpageseriously";
    NSUserDefaults * defaults = [[NSUserDefaults alloc]init];
    [defaults setObject:_state forKey:@"state"];
    [defaults synchronize];

}


- (IBAction)deleteact:(id)sender {

    for (int k =0;k < [_Activitylist count] ; k++) {
        Activity * act = [[Activity alloc]init];
        act = [_Activitylist objectAtIndex:k];
         Activity * act2 = [[Activity alloc]init];
        act2 = [_Activitylisttwenty objectAtIndex:k];
        
        if([ act.activityname caseInsensitiveCompare: _enteractivity.text ]) {
                            [_Activitylist removeObject: act];
                [_Activitylisttwenty removeObject: act2];
            
            NSUserDefaults * defaults = [[NSUserDefaults alloc]init];
            NSString * save = [NSString stringWithFormat:@""];
              NSString * save2 = [NSString stringWithFormat:@""];
            int number = [[defaults objectForKey:@"number"]intValue] - 1;
            NSLog(@"23.whatsapp %d",number);
            NSString * numberstring = [NSString stringWithFormat:@"%d",number];
            [defaults setObject:numberstring forKey:@"number"];
            
            for(int x = 0; x < [_Activitylist count]; x++) {
                
                Activity * newAct = [_Activitylist objectAtIndex:x];
                Activity * newAct2 = [_Activitylisttwenty objectAtIndex:x];
                
                save = [save stringByAppendingFormat:@" %@$t%f$t", newAct.activityname, newAct.hours];
            save2 = [save2 stringByAppendingFormat:@" %@$t%f$t", newAct2.activityname, newAct2.hours];
            
            }
          
            [defaults setObject:save forKey:@"save"];
             [defaults setObject:save forKey:@"save2"];
            [defaults synchronize];
        
        }
    
           
           for (UILocalNotification *notification in [[[UIApplication sharedApplication] scheduledLocalNotifications] copy]){
               NSDictionary *userInfo = notification.userInfo;
               if ([_enteractivity.text caseInsensitiveCompare:[userInfo objectForKey:@"mykey"]] == NSOrderedSame){
                   [[UIApplication sharedApplication] cancelLocalNotification:notification];
             
               }
           }

              }
    
    
    _enteractivity.text = @"";
    _table.text = @"";
    _table2.text = @"";
_display = [[NSMutableString alloc]init];
    _display2 =[[NSMutableString alloc]init];
}

-(void)viewDidAppear:(BOOL)animated {
    NSUserDefaults * defaults = [[NSUserDefaults alloc]init];
    NSString * state = [defaults objectForKey:@"state"];
    if([state caseInsensitiveCompare:@"onactpageseriously"] == NSOrderedSame) {
        
        self.view.backgroundColor = [[UIColor alloc]initWithPatternImage:[UIImage imageNamed:@"chutney.png"]];
        _time.hidden = YES;
        _activity.hidden = YES;
        _hours.hidden = YES;
        _enteractivity.hidden = NO;
        _button.hidden = NO;
        _table.hidden = YES;
        _upgradebut.hidden = YES;
        _instructionsb.hidden = NO;
        _activitybutton.hidden = NO;
        _actlabel.hidden = YES;
        _hourslabel.hidden = YES;
        _titleb.hidden = NO;
        _newactivity.hidden = YES;
        _deletebut.hidden = NO;
        _disbut.hidden = YES;
        _hourstilldate.hidden = YES;
        _table2.hidden = YES;

        
    }
    
}

@end
