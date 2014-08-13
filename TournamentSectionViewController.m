//
//  TournamentSectionViewController.m
//  SecondScreenApp
//
//  Created by Ricardo Lunar on 12/08/13.
//  Copyright (c) 2013 Ricardo Lunar. All rights reserved.
//

#import "TournamentSectionViewController.h"

@interface TournamentSectionViewController ()

@end

@implementation TournamentSectionViewController

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

-(void) generateLapMatch: (int) i column:(int) j forN: (int) divisions heightOfLap: (CGFloat) height widthOfLap: (CGFloat) width withData: (NSArray *) data inScreenOf: (CGSize) size{
    
    CGFloat fontSize = 13.00;
    
    CGFloat tile = 125;
    CGFloat margin = ((size.height/divisions)*j);
    CGFloat sectionHalf = ((size.height/divisions)-tile)/2;
    
    self.view.frame = CGRectMake(10.0,margin+sectionHalf,width-20,tile); //CGRectMake(10.00, posY+5, width-20, heightLap);
    self.view.backgroundColor = [UIColor colorWithRed:10/255 green:10/255 blue:10/255 alpha:0.6f];//[UIColor clearColor];
    self.view.layer.cornerRadius = cornerRadius;
    self.view.layer.masksToBounds = YES;
    //self.view.layer.borderColor = [UIColor blackColor].CGColor;
    //self.view.layer.borderWidth = 1.0f;
    CGFloat offsetY = (tile/2)-25.5;//(i==floor((size.width/width)/2))?(heightLap/2)-22.5+65:(heightLap/2)-22.5;
    CGFloat offsetX = 10;
    
    if([data count]>0){
        Match *match = ((Match *)[data objectAtIndex:j]);
        if(match.idTeam1){
            CGRect rect1 = CGRectMake(offsetX,offsetY,30,20);
            self.flag1.frame = rect1;
            NSString *imageFilePath2 = [[NSBundle mainBundle]
                                        pathForResource: [NSString stringWithFormat:@"f%@",match.idTeam1]
                                        ofType:@"png"];
            UIImage *img2 = [UIImage imageWithContentsOfFile:imageFilePath2];
            [self.flag1 setImage:img2];
        }
        
        if(match.idTeam2){
            CGRect rect2 = CGRectMake(offsetX,offsetY+30,30,20);
            self.flag2.frame = rect2;
            NSString *imageFilePath2 = [[NSBundle mainBundle]
                                        pathForResource: [NSString stringWithFormat:@"f%@",match.idTeam2]
                                        ofType:@"png"];
            UIImage *img2 = [UIImage imageWithContentsOfFile:imageFilePath2];
            [self.flag2 setImage:img2];
        }
        
        if(match.idTeam1){
            CGRect rect1 = CGRectMake(offsetX+38,offsetY-15,60,50);
            self.team1.frame = rect1;
            self.team1.backgroundColor = [UIColor clearColor];
            [self.team1 setText: [Utils getTeamProperty:@"name"
                                              ofTeamKey:[NSString stringWithFormat:@"%@",match.idTeam1]]];
            self.team1.textColor = [UIColor whiteColor];
            self.team1.font = [UIFont fontWithName:@"Arial" size:fontSize];
        }else{
            CGRect rect1 = CGRectMake(offsetX+38,offsetY-15,60,50);
            self.team1.frame = rect1;
            self.team1.backgroundColor = [UIColor clearColor];
            [self.team1 setText: @""];
            self.team1.textColor = [UIColor whiteColor];
            self.team1.font = [UIFont fontWithName:@"Arial" size:fontSize];
            
            //Setting name of the match instead
            CGRect rect2 = CGRectMake(offsetX+2,offsetY-15,100,80);
            self.name.frame = rect2;
            self.name.backgroundColor = [UIColor clearColor];
            //NSLog(@"Match name == %@",match.name);
            [self.name setText: match.name];
            self.name.textColor = [UIColor whiteColor];
            self.name.font = [UIFont fontWithName:@"Arial" size:fontSize];
        }
        
        if(match.idTeam2){
            CGRect rect2 = CGRectMake(offsetX+38,offsetY+15,60,50);
            self.team2.frame = rect2;
            self.team2.backgroundColor = [UIColor clearColor];
            [self.team2 setText:[Utils getTeamProperty:@"name"
                                             ofTeamKey:[NSString stringWithFormat:@"%@",match.idTeam2]]];
            self.team2.textColor = [UIColor whiteColor];
            self.team2.font = [UIFont fontWithName:@"Arial" size:fontSize];
        }else{
            CGRect rect2 = CGRectMake(offsetX+38,offsetY+15,60,50);
            self.team2.frame = rect2;
            self.team2.backgroundColor = [UIColor clearColor];
            [self.team2 setText:@""];
            self.team2.textColor = [UIColor whiteColor];
            self.team2.font = [UIFont fontWithName:@"Arial" size:fontSize];
        }
        
        if(match.scoreTeam1){
            CGRect rect3 = CGRectMake(offsetX-10,offsetY-2,225,25);
            self.score1.frame = rect3;
            self.score1.backgroundColor = [UIColor clearColor];
            [self.score1 setText:[NSString stringWithFormat:@"%@",match.scoreTeam1]];
            self.score1.textColor = [UIColor whiteColor];
            self.score1.font = [UIFont fontWithName:@"Arial" size:fontSize];
        }else{
            CGRect rect3 = CGRectMake(offsetX-10,offsetY-2,225,25);
            self.score1.frame = rect3;
            self.score1.backgroundColor = [UIColor clearColor];
            [self.score1 setText:@""];
            self.score1.textColor = [UIColor whiteColor];
            self.score1.font = [UIFont fontWithName:@"Arial" size:fontSize];
        }
        if(match.scoreTeam2){
            CGRect rect4 = CGRectMake(offsetX-10,offsetY+28,225,25);
            self.score2.frame = rect4;
            self.score2.backgroundColor = [UIColor clearColor];
            [self.score2 setText:[NSString stringWithFormat:@"%@",match.scoreTeam2]];
            self.score2.textColor = [UIColor whiteColor];
            self.score2.font = [UIFont fontWithName:@"Arial" size:fontSize];
        }else{
            CGRect rect4 = CGRectMake(offsetX-10,offsetY+28,225,25);
            self.score2.frame = rect4;
            self.score2.backgroundColor = [UIColor clearColor];
            [self.score2 setText:@""];
            self.score2.textColor = [UIColor whiteColor];
            self.score2.font = [UIFont fontWithName:@"Arial" size:fontSize];
        }
        
        if(![[NSString stringWithFormat:@"%@",match.penalties1] isEqualToString:@"-1"] && ![[NSString stringWithFormat:@"%@",match.penalties2] isEqualToString:@"-1"]){
            CGRect rect5 = CGRectMake((width/2)-25,offsetY+50,225,25);
            self.penalty.frame = rect5;
            self.penalty.backgroundColor = [UIColor clearColor];
            NSString *penalties = [NSString stringWithFormat:@"(%@ - %@)",[NSString stringWithFormat:@"%@",match.penalties1],[NSString stringWithFormat:@"%@",match.penalties2]];
            [self.penalty setText:penalties];
            self.penalty.textColor = [UIColor whiteColor];
            self.penalty.font = [UIFont fontWithName:@"Arial" size:fontSize];
        }else{
            CGRect rect5 = CGRectMake((width/2)-25,offsetY+50,225,25);
            self.penalty.frame = rect5;
            self.penalty.backgroundColor = [UIColor clearColor];
            [self.penalty setText:@""];
            self.penalty.textColor = [UIColor whiteColor];
            self.penalty.font = [UIFont fontWithName:@"Arial" size:fontSize];
        }
    }
    
    
}

@end
