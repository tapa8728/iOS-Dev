//
//  ViewController.h
//  Tap Me
//
//  Created by junho on 11/12/14.
//  Copyright (c) 2014 TanviInc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


@interface ViewController : UIViewController<UIAlertViewDelegate>
{
    IBOutlet UILabel *scoreLabel;
    IBOutlet UILabel *timeLabel;
    
    NSInteger count;
    NSInteger seconds;
    NSTimer *timer;
    
    AVAudioPlayer *buttonBeep;
    AVAudioPlayer *secondBeep;
    AVAudioPlayer *backgroundSong;
    
}
- (IBAction)buttonPressed;
@end

