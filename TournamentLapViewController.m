//
//  TournamentLapViewController.m
//  SecondScreenApp
//
//  Created by Ricardo Lunar on 12/08/13.
//  Copyright (c) 2013 Ricardo Lunar. All rights reserved.
//

#import "TournamentLapViewController.h"
#import "TournamentMatchDetailViewController.h"

@interface TournamentLapViewController ()

@end

@implementation TournamentLapViewController

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

-(void) setThirdWith:(NSArray *) data heightOf: (CGFloat) heightLap widthOf: (CGFloat) lapWidth{
    // HANDLING THIRD/FOURTH GAME
    if(data[1]!=nil){
        UIView *third = [[UIView alloc] initWithFrame:CGRectMake(10.00,heightLap-125, lapWidth, 120)];
        third.backgroundColor = [UIColor colorWithRed:10/255 green:10/255 blue:10/255 alpha:0.6f];//[UIColor clearColor];
        third.layer.cornerRadius = cornerRadius;
        third.layer.masksToBounds = YES;
        
        UIImageView *flag1 = [[UIImageView alloc] init];
        UIImageView *flag2 = [[UIImageView alloc] init];
        UILabel *team1 = [[UILabel alloc] init];
        UILabel *team2 = [[UILabel alloc] init];
        UILabel *score1 = [[UILabel alloc] init];
        UILabel *score2 = [[UILabel alloc] init];
        UILabel *penalty = [[UILabel alloc] init];
        UILabel *name = [[UILabel alloc] init];
        
        int offsetY = 90/2-25.5;
        int offsetX = 10;
        CGFloat fontSize = 13.00;
        
        Match *match = ((Match *)[((NSMutableArray *)[data objectAtIndex:1]) objectAtIndex:0]);
        
        if(match.idTeam1){
            CGRect rect1 = CGRectMake(offsetX,offsetY,30,20);
            flag1.frame = rect1;
            NSString *imageFilePath2 = [[NSBundle mainBundle]
                                        pathForResource: [NSString stringWithFormat:@"f%@",match.idTeam1]
                                        ofType:@"png"];
            UIImage *img2 = [UIImage imageWithContentsOfFile:imageFilePath2];
            [flag1 setImage:img2];
        }
        
        if(match.idTeam2){
            CGRect rect2 = CGRectMake(offsetX,offsetY+30,30,20);
            flag2.frame = rect2;
            NSString *imageFilePath2 = [[NSBundle mainBundle]
                                        pathForResource: [NSString stringWithFormat:@"f%@",match.idTeam2]
                                        ofType:@"png"];
            UIImage *img2 = [UIImage imageWithContentsOfFile:imageFilePath2];
            [flag2 setImage:img2];
        }
        
        if(match.idTeam1){
            CGRect rect1 = CGRectMake(offsetX+38,offsetY-15,60,50);
            team1.frame = rect1;
            team1.backgroundColor = [UIColor clearColor];
            [team1 setText: [Utils getTeamProperty:@"name"
                                              ofTeamKey:[NSString stringWithFormat:@"%@",match.idTeam1]]];
            team1.textColor = [UIColor whiteColor];
            team1.font = [UIFont fontWithName:@"Arial" size:fontSize];
        }else{
            CGRect rect1 = CGRectMake(offsetX+38,offsetY-15,60,50);
            team1.frame = rect1;
            team1.backgroundColor = [UIColor clearColor];
            [team1 setText: @""];
            team1.textColor = [UIColor whiteColor];
            team1.font = [UIFont fontWithName:@"Arial" size:fontSize];
            
            //Setting name of the match instead
            CGRect rect2 = CGRectMake(offsetX+4,offsetY,100,80);
            name.frame = rect2;
            name.backgroundColor = [UIColor clearColor];
            [name setText: match.name];
            name.textColor = [UIColor whiteColor];
            name.lineBreakMode = NSLineBreakByWordWrapping;
            name.numberOfLines = 3;
            name.textAlignment = NSTextAlignmentCenter;
            name.font = [UIFont fontWithName:@"Arial" size:fontSize];
        }
        
        if(match.idTeam2){
            CGRect rect2 = CGRectMake(offsetX+38,offsetY+15,60,50);
            team2.frame = rect2;
            team2.backgroundColor = [UIColor clearColor];
            [team2 setText:[Utils getTeamProperty:@"name"
                                             ofTeamKey:[NSString stringWithFormat:@"%@",match.idTeam2]]];
            team2.textColor = [UIColor whiteColor];
            team2.font = [UIFont fontWithName:@"Arial" size:fontSize];
        }else{
            CGRect rect2 = CGRectMake(offsetX+38,offsetY+15,60,50);
            team2.frame = rect2;
            team2.backgroundColor = [UIColor clearColor];
            [team2 setText:@""];
            team2.textColor = [UIColor whiteColor];
            team2.font = [UIFont fontWithName:@"Arial" size:fontSize];
        }
        
        if(match.scoreTeam1){
            CGRect rect3 = CGRectMake(offsetX+100,offsetY-2,225,25);
            score1.frame = rect3;
            score1.backgroundColor = [UIColor clearColor];
            [score1 setText:[NSString stringWithFormat:@"%@",match.scoreTeam1]];
            score1.textColor = [UIColor whiteColor];
            score1.font = [UIFont fontWithName:@"Arial" size:fontSize];
        }else{
            CGRect rect3 = CGRectMake(offsetX+100,offsetY-2,225,25);
            score1.frame = rect3;
            score1.backgroundColor = [UIColor clearColor];
            [score1 setText:@""];
            score1.textColor = [UIColor whiteColor];
            score1.font = [UIFont fontWithName:@"Arial" size:fontSize];
        }
        
        if(match.scoreTeam2){
            CGRect rect4 = CGRectMake(offsetX+100,offsetY+28,225,25);
            score2.frame = rect4;
            score2.backgroundColor = [UIColor clearColor];
            [score2 setText:[NSString stringWithFormat:@"%@",match.scoreTeam2]];
            score2.textColor = [UIColor whiteColor];
            score2.font = [UIFont fontWithName:@"Arial" size:fontSize];
        }else{
            CGRect rect4 = CGRectMake(offsetX+100,offsetY+28,225,25);
            score2.frame = rect4;
            score2.backgroundColor = [UIColor clearColor];
            [score2 setText:@""];
            score2.textColor = [UIColor whiteColor];
            score2.font = [UIFont fontWithName:@"Arial" size:fontSize];
        }
        
        if(![[NSString stringWithFormat:@"%@",match.penalties1] isEqualToString:@"-1"] && ![[NSString stringWithFormat:@"%@",match.penalties2] isEqualToString:@"-1"]){
            CGRect rect5 = CGRectMake((lapWidth/2)-12.5,offsetY+50,225,25);
            penalty.frame = rect5;
            penalty.backgroundColor = [UIColor clearColor];
            NSString *penalties = [NSString stringWithFormat:@"(%@ - %@)",[NSString stringWithFormat:@"%@",match.penalties1],[NSString stringWithFormat:@"%@",match.penalties2]];
            [penalty setText:penalties];
            penalty.textColor = [UIColor whiteColor];
            penalty.font = [UIFont fontWithName:@"Arial" size:fontSize];
        }else{
            CGRect rect5 = CGRectMake((lapWidth/2)-25,offsetY+50,225,25);
            penalty.frame = rect5;
            penalty.backgroundColor = [UIColor clearColor];
            [penalty setText:@""];
            penalty.textColor = [UIColor whiteColor];
            penalty.font = [UIFont fontWithName:@"Arial" size:fontSize];
        }
        
        [third addSubview:flag1];
        [third addSubview:flag2];
        [third addSubview:team1];
        [third addSubview:team2];
        [third addSubview:score1];
        [third addSubview:score2];
        [third addSubview:penalty];
        [third addSubview:name];
        
        [self.view insertSubview:third atIndex:[self.view.subviews count]];
    }
}

-(void) generateLap: (int) i forN: (int) divisions inScreenOf: (CGSize) size forLaps: (int) laps withData: (NSArray *) data{
    CGFloat lapWidth = floor(size.width/laps);
    CGFloat height = size.height;
    CGFloat posX = lapWidth*i;
    
    self.view.backgroundColor = [UIColor clearColor];
    self.view.frame = CGRectMake(posX, 0, lapWidth, height);
    
    NSArray *dataForDivisions = [Utils getDataForDivision: i using: data andNumEtapas: laps];
    
    if(i == floor(laps/2) && [data[1] count] != 0){
        height = height-130;
    }
    
    for(int j=0; j<divisions; j++){
        TournamentSectionViewController *tsvc = [[TournamentSectionViewController alloc] initWithNibName:@"TournamentSectionViewController" bundle:nil];
        
        [((TournamentSectionViewController *) tsvc) generateLapMatch: i column: j forN: divisions heightOfLap: height widthOfLap: lapWidth withData: dataForDivisions inScreenOf: (CGSize) size];
        [self.view addSubview:tsvc.view];
    }
    
    if(i == floor(laps/2) && [data[1] count] != 0){
        //NSLog(@"Setting third/fourth game");
        [self setThirdWith: data heightOf: height+130 widthOf: lapWidth-20];
    }
    
    [self addLinesIn: lapWidth forN: divisions inScreenOf: size forLapMatch: i];
}

- (void) addLinesIn:(CGFloat) lapWidth forN: (int) divisions inScreenOf: (CGSize) size forLapMatch: (int) i{
    int numOfImgs = floor(divisions/2);
    
    if(numOfImgs>0){
        for (int j = 0; j<numOfImgs; j++) {
            CGFloat heightImg = (size.height/numOfImgs)*0.5;
            UIImage * myImage = [UIImage imageNamed: @"tournamentLines.png"];
            UIImage * myImage2 = [UIImage imageNamed: @"tournamentLinesFlipped.png"];
            UIImageView * myImageView;
            CGRect frame;
            CGFloat offset = (size.height/numOfImgs)*0.25;
            if(i<=(floor(size.width/lapWidth))/2){
                myImageView = [[UIImageView alloc] initWithImage: myImage];
                frame = CGRectMake(((floor(j / numOfImgs)+1)*lapWidth)-10,(j*(heightImg+(2*offset)))+offset, 20, heightImg);
            }else{
                myImageView = [[UIImageView alloc] initWithImage: myImage2];
                frame = CGRectMake(((floor(j / numOfImgs))*lapWidth)-10,(j*(heightImg+(2*offset)))+offset, 20, heightImg);
            }
            
            myImageView.frame = frame;
            [self.view insertSubview:myImageView atIndex:[self.view.subviews count]];
        }
    }
    
    if(i == (floor((size.width/lapWidth)/2))){
        numOfImgs = 1;
        CGFloat heightImg = (size.height/numOfImgs)*0.5;
        CGFloat offset = (size.height/numOfImgs)*0.25;
        UIImage * myImage = [UIImage imageNamed: @"tournamentLinesCenter.png"];
        CGRect frame = CGRectMake(lapWidth-10,offset, 20, heightImg);
        UIImageView *myImageView = [[UIImageView alloc] initWithImage: myImage];
        myImageView.frame = frame;
        [self.view insertSubview:myImageView atIndex:[self.view.subviews count]];
        
        UIImageView *myImageView2 = [[UIImageView alloc] initWithImage: myImage];
        CGRect frame2 = CGRectMake(-10,offset, 20, heightImg);
        myImageView2.frame = frame2;
        [self.view insertSubview:myImageView2 atIndex:[self.view.subviews count]];
    }

}

@end
