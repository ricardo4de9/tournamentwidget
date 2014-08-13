//
//  TournamentViewController.m
//  SecondScreenApp
//
//  Created by Ricardo Lunar on 05/08/13.
//  Copyright (c) 2013 Ricardo Lunar. All rights reserved.
//

#import "TournamentViewController.h"
#import "NoTransmissionViewController.h"

@interface TournamentViewController ()

@end

@implementation TournamentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
        self.view.frame = CGRectMake(0, 0,[appDelegate.window bounds].size.height,[appDelegate.window bounds].size.width);
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // EXECUTING REQUEST FOR UPDATED TOURNAMENT INFORMATION
    facade = [[Facade alloc] init];
    [facade setDelegate:self];
    
    request = [NSURLRequest requestWithURL:[NSURL URLWithString:tournamentURL]];
    [facade getInfoFrom:request forViewController:self];
    
    [self.view setNeedsDisplay];
    [self.view reloadInputViews];
    
    [self.name setText:NSLocalizedString(@"Tournament", @"")];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+ (NSArray *) getArrayWithData:(NSMutableDictionary *)brackets forEtapa:(int) i{
    NSArray *array;
    
    if([brackets objectForKey:[NSString stringWithFormat:@"etapa%d",i]]){
        array = [brackets objectForKey:[NSString stringWithFormat:@"etapa%d",i]];
    }else{
        array = @[];
    }
    
    return array;
}

// CALLBACK TO HANDLE TOURNAMENT JSON PAYLOAD
- (void) setFromData: (NSMutableDictionary *) brackets{
    
    //NSLog(@"[TournamentViewController] TOURNAMENT: %@",brackets);

    NSNumber *etapas;
    NSArray *octavos;
    NSArray *cuartos;
    NSArray *semifinal;
    NSArray *final;
    NSArray *tercer;
    
    if([brackets valueForKey:@"etapas"]){
        etapas = [brackets valueForKey:@"etapas"];
    }
    
    for (int i = 0; i < [etapas intValue]+1; i++) {
        if(i == 0){
            octavos = [TournamentViewController getArrayWithData:brackets forEtapa:i];
        }else if(i == 1){
            cuartos = [TournamentViewController getArrayWithData:brackets forEtapa:i];
        }else if(i == 2){
            semifinal = [TournamentViewController getArrayWithData:brackets forEtapa:i];
        }else if(i == 3){
            final = [TournamentViewController getArrayWithData:brackets forEtapa:i];
        }
    }
    
    if([brackets objectForKey:@"tercer"]){
        tercer = [brackets objectForKey:@"tercer"];
    }else{
        tercer = @[];
    }
    
    NSArray *matches = @[octavos,cuartos,semifinal,final];
    
    self.tgvc = [[TournamentGridViewController alloc] initWithNibName:@"TournamentGridViewController" bundle:nil];
    
    NSString *timezone = [brackets objectForKey:@"timezone"];
    
    [self.tgvc generateTournament:etapas withMatches:matches andThird:tercer andTimezone:timezone];
    [self.view addSubview:self.tgvc.view];
    
}

// BACK BUTTON SELECTOR
- (IBAction)handleTap:(UITapGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateEnded) {
        [facade cancelRequest:request];
        [self curlViewFromTile];
    }
}

- (void)curlViewFromTile{
    [[self.view subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];

    [UIView transitionWithView:[self.view superview]
                      duration:1
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations:^{
                        [self.view removeFromSuperview];
                    } completion:nil];
    
    [((NoTransmissionViewController *) [[ControllerManager controllerManager] controllerByName:@"NoTransmissionViewController"]) reloadViewData];
}

- (void) showReloadView{
    rvc = [[ReloadViewController alloc] initWithNibName:@"ReloadViewController" bundle:nil];
    rvc.view.frame = CGRectMake((self.view.bounds.size.width-445)/2, (self.view.bounds.size.height-144)/2, 445, 114);
    [self.view addSubview:rvc.view];
    [rvc setDelegate:self];
}

-(void)reloadButtonClick{
    [rvc.view removeFromSuperview];
    facade = [[Facade alloc] init];
    [facade setDelegate:self];
    request = [NSURLRequest requestWithURL:[NSURL URLWithString:tournamentURL]];
    [facade getInfoFrom:request forViewController:self];
}

@end
