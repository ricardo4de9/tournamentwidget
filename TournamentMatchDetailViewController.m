//
//  TournamentMatchDetailViewController.m
//  SecondScreen
//
//  Created by Ricardo Lunar on 25/11/13.
//  Copyright (c) 2013 Ricardo Lunar. All rights reserved.
//

#import "TournamentMatchDetailViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "Constants.h"

@interface TournamentMatchDetailViewController ()

@end

@implementation TournamentMatchDetailViewController

@synthesize date;

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
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor colorWithRed:10/255 green:10/255 blue:10/255 alpha:0.6f];//[UIColor clearColor];
    self.view.layer.cornerRadius = cornerRadius;
    self.view.layer.masksToBounds = YES;
    
    // Showing for 5 seconds
    self.timer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(closeMatchDetail) userInfo:nil repeats:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)closeMatchDetail{
    [self.timer invalidate];
    self.timer = nil;
    [self.view.superview.subviews setValue:@NO forKeyPath:@"hidden"];
    self.view.superview.backgroundColor = [UIColor colorWithRed:10/255 green:10/255 blue:10/255 alpha:0.6f];
    [UIView transitionWithView:[self.view superview]
                      duration:1
                       options:UIViewAnimationOptionTransitionFlipFromBottom
                    animations:^{
                        
                        [self.view removeFromSuperview];
                        
                    } completion:nil];
}


+(NSString *) adaptDateToShow: (NSDate *) date{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEE ',' dd MMM h:mm a"];
    //[dateFormatter setDateFormat:@"dd/MM/YYYY h:mm a"];
    //[dateFormatter setDateFormat:@"h:mm a"];
    NSString *newDate = [dateFormatter stringFromDate:date];
    
    return newDate;
}

+(NSString *) changeDate: (NSString *) str withTimezone: (NSString *) timezone{
    NSString *date = [str stringByAppendingString:[@" " stringByAppendingString:timezone]];
    NSDateFormatter* gmtDf = [[NSDateFormatter alloc] init];
    [gmtDf setDateFormat:@"yyyy-MM-dd HH:mm:ss ZZZ"];
    [gmtDf setTimeZone:[NSTimeZone systemTimeZone]];
    [gmtDf setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"es"]];
    NSDate* gmtDate = [gmtDf dateFromString:date];
    NSString *finaldate = [TournamentMatchDetailViewController adaptDateToShow: gmtDate];
    
    return finaldate;
}

@end
