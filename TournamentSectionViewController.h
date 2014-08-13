//
//  TournamentSectionViewController.h
//  SecondScreenApp
//
//  Created by Ricardo Lunar on 12/08/13.
//  Copyright (c) 2013 Ricardo Lunar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "Utils.h"

@interface TournamentSectionViewController : UIViewController

@property (nonatomic, retain) IBOutlet UIView *view;
@property (nonatomic, retain) IBOutlet UILabel *name;
@property (nonatomic, retain) IBOutlet UILabel *team1;
@property (nonatomic, retain) IBOutlet UILabel *team2;
@property (nonatomic, retain) IBOutlet UILabel *score1;
@property (nonatomic, retain) IBOutlet UILabel *score2;
@property (nonatomic, retain) IBOutlet UILabel *penalty;
@property (nonatomic, retain) IBOutlet UIImageView *flag1;
@property (nonatomic, retain) IBOutlet UIImageView *flag2;

-(void) generateLapMatch: (int) i column:(int) j forN: (int) divisions heightOfLap: (CGFloat) height widthOfLap: (CGFloat) width withData: (NSArray *) data inScreenOf: (CGSize) size;

@end
