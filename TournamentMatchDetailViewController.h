//
//  TournamentMatchDetailViewController.h
//  SecondScreen
//
//  Created by Ricardo Lunar on 25/11/13.
//  Copyright (c) 2013 Ricardo Lunar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TournamentMatchDetailViewController : UIViewController

@property (nonatomic,retain) IBOutlet UILabel *date;
@property (nonatomic,retain) NSTimer *timer;

+(NSString *) changeDate: (NSString *) str withTimezone: (NSString *) timezone;
@end
