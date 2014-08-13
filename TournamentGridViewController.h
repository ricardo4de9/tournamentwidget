//
//  TournamentGridViewController.h
//  SecondScreenApp
//
//  Created by Ricardo Lunar on 12/08/13.
//  Copyright (c) 2013 Ricardo Lunar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TournamentLapViewController.h"

@interface TournamentGridViewController : UIViewController

@property (nonatomic, retain) IBOutlet UIView *view;
@property int width;
@property int height;
@property int offset;
@property (nonatomic, retain) NSMutableDictionary *idsForHashes;
@property (nonatomic,retain) NSString *timezone;
@property int laps;

-(void) generateTournament:(NSNumber *) numEtapas withMatches: (NSArray *) matches andThird: (NSArray *) tercer andTimezone: (NSString *) timezone;

@end
