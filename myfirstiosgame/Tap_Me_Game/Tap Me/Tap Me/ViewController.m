//
//  ViewController.m
//  Tap Me
//
//  Created by junho on 11/12/14.
//  Copyright (c) 2014 TanviInc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


-(AVAudioPlayer *)setupAudioPlayerWithFile:(NSString *)file type:(NSString *)type
{
    NSString *path = [[NSBundle mainBundle] pathForResource:file ofType:type];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSError *err;
    
    AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&err];
    
    if(!audioPlayer)
    {
        
        NSLog(@"%@", [err description]);
    }
    //return a created AVAudioPlayer object
    return audioPlayer;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Graphics
    self.view.backgroundColor = [UIColor grayColor];
    scoreLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"field_score.png"]];
    timeLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"field_time.png"]];
    
    //Audio
    buttonBeep = [self setupAudioPlayerWithFile:@"ButtonTap" type:@"wav"];
    secondBeep = [self setupAudioPlayerWithFile:@"SecondBeep" type:@"wav"];
    backgroundSong = [self setupAudioPlayerWithFile:@"HallOfTheMountainKing" type:@"mp3"];
    
    //what methods do u want to call once the view loads?
    [self gameSetup];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//what happens when you press the button
- (IBAction)buttonPressed
{
    count++;
    scoreLabel.text = [NSString stringWithFormat:@"SCORE: %i", count];
    NSLog(@"Button Pressed %i times", count);
    [buttonBeep play];
}

//timing the game
-(void)gameSetup
{
    seconds=10;
    count=0;
    timeLabel.text = [NSString stringWithFormat:@"Time Left: %i",seconds];
    scoreLabel.text = [NSString stringWithFormat:@"SCORE: %i", count];
    
    //setting the core timer-logic
    timer = [NSTimer scheduledTimerWithTimeInterval: 1.0f
                                             target: self
                                           selector: @selector(subtractTime)
                                           userInfo: nil
                                            repeats: YES];
    [backgroundSong setVolume:0.2];
    [backgroundSong play];

    
}

//called by the timer
-(void)subtractTime
{
    seconds--;
    [secondBeep play];
    timeLabel.text = [NSString stringWithFormat:@"Time Left: %i",seconds];
    if(seconds == 0)
    {
        [timer invalidate];
        //display stop alert to user
        UIAlertView *stopAlert = [[UIAlertView alloc] initWithTitle:@"Time is UP!!"
                                                            message:[NSString stringWithFormat: @"You have scored %i points", count]
                                                           delegate:self
                                                  cancelButtonTitle:@"Play Again!"
                                                  otherButtonTitles:nil];
        [stopAlert show];
    }
    
}

//VC is a delegate for UIAlertView
//So once the "Play Again" button is pressed, it will restart the game!
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //call gameSetup to re-initialize the whole setup
    [self gameSetup];
}
@end
