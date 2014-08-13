//
//  TournamentLapViewController.h
//  SecondScreenApp
//
//  Created by Ricardo Lunar on 12/08/13.
//  Copyright (c) 2013 Ricardo Lunar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Utils.h"
#import "TournamentSectionViewController.h"

@interface TournamentLapViewController : UIViewController

@property (nonatomic, retain) IBOutlet UIView *view;

-(void) generateLap: (int) i forN: (int) divisions inScreenOf: (CGSize) size forLaps: (int) laps withData: (NSArray *) data;

@end
