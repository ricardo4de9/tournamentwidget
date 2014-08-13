//
//  TournamentComplementViewController.h
//  SecondScreenDemo
//
//  Created by Ricardo Lunar on 12/11/13.
//  Copyright (c) 2013 Ricardo Lunar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TournamentComplementViewController : UIViewController

@property (nonatomic,retain) IBOutlet UILabel *nextLabel;
@property (nonatomic,retain) IBOutlet UILabel *winnerLabel;
@property (nonatomic,retain) IBOutlet UILabel *name;
@property (nonatomic,retain) IBOutlet UILabel *name1;
@property (nonatomic,retain) IBOutlet UILabel *name2;
@property (nonatomic,retain) IBOutlet UIImageView *flag;
@property (nonatomic,retain) IBOutlet UIImageView *flag1;
@property (nonatomic,retain) IBOutlet UIImageView *flag2;
@property (nonatomic,retain) IBOutlet UILabel *matchname;
- (void)setInfo:(NSMutableDictionary *)json;

@end
