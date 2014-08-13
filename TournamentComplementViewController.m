//
//  TournamentComplementViewController.m
//  SecondScreenDemo
//
//  Created by Ricardo Lunar on 12/11/13.
//  Copyright (c) 2013 Ricardo Lunar. All rights reserved.
//

#import "TournamentComplementViewController.h"
#import "Utils.h"

@interface TournamentComplementViewController ()

@end

@implementation TournamentComplementViewController

@synthesize name,name1,name2,flag,flag1,flag2,nextLabel,winnerLabel,matchname;

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setInfo:(NSMutableDictionary *)json{
    if([json objectForKey:@"match"]){
        Match *match = [ParserMatch parse:[json objectForKey:@"match"]];
        
        [self.name setHidden:YES];
        [self.flag setHidden:YES];
        
        if(![match.name isEqualToString:@""]){
            [self.name1 setText:[Utils getTeamProperty:@"name"
                                             ofTeamKey:[NSString stringWithFormat:@"%@",match.idTeam1]]];
            [self.name2 setText:[Utils getTeamProperty:@"name"
                                             ofTeamKey:[NSString stringWithFormat:@"%@",match.idTeam2]]];
            
            NSString *imageFilePath1 = [[NSBundle mainBundle]
                                        pathForResource: [NSString stringWithFormat:@"f%@",match.idTeam1]ofType:@"png"];
            UIImage *img1 = [UIImage imageWithContentsOfFile:imageFilePath1];
            [self.flag1 setImage:img1];
            
            NSString *imageFilePath2 = [[NSBundle mainBundle]
                                        pathForResource: [NSString stringWithFormat:@"f%@",match.idTeam2]ofType:@"png"];
            UIImage *img2 = [UIImage imageWithContentsOfFile:imageFilePath2];
            [self.flag2 setImage:img2];
        }else{
            [self.name1 setHidden:YES];
            [self.flag1 setHidden:YES];
            [self.name2 setHidden:YES];
            [self.flag2 setHidden:YES];
            [self.matchname setText:match.name];
        }
    }
    
    if([json objectForKey:@"opponent"]){
        NSNumber *opponent = [json objectForKey:@"opponent"];
        [self.name1 setHidden:YES];
        [self.flag1 setHidden:YES];
        [self.name2 setHidden:YES];
        [self.flag2 setHidden:YES];
        [self.matchname setHidden:YES];
        
        [self.name setText:[Utils getTeamProperty:@"name"
                                         ofTeamKey:[NSString stringWithFormat:@"%@",opponent]]];
        
        NSString *imageFilePath1 = [[NSBundle mainBundle]
                                    pathForResource: [NSString stringWithFormat:@"f%@",opponent]ofType:@"png"];
        UIImage *img1 = [UIImage imageWithContentsOfFile:imageFilePath1];
        [self.flag setImage:img1];
    }
}

@end
