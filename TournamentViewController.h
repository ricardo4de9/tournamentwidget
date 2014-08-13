//
//  TournamentViewController.h
//  SecondScreenApp
//
//  Created by Ricardo Lunar on 05/08/13.
//  Copyright (c) 2013 Ricardo Lunar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "Facade.h"
#import "ReloadViewController.h"
#import "TournamentGridViewController.h"

@interface TournamentViewController : UIViewController<FacadeDelegate,ReloadViewDelegate>
{
    Facade *facade;
    ReloadViewController *rvc;
    NSURLRequest *request;
}

@property (nonatomic, retain) IBOutlet UIView *view;
@property (nonatomic,retain) IBOutlet UIButton *backButton;
@property (nonatomic, retain) IBOutlet UILabel *name;
@property (nonatomic,retain) TournamentGridViewController *tgvc;

- (void) setFromData: (NSMutableDictionary *)json;

@end
