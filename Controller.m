//
//  Controller.m
//  Countdown
//
//  Created by Brian Cooke on 6/12/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Controller.h"

@interface Controller(private)
- (void) timerFired:(NSTimer *)theTimer;
@end


@implementation Controller

//------------------------------------------------------------------------------
// countdown
//------------------------------------------------------------------------------
- (IBAction) countdown:(id)sender
{
    NSInteger secondsLeft = [minutesToCountTextField intValue] * 60;
    endAt = [[NSDate dateWithTimeIntervalSinceNow:secondsLeft] retain];
    
    timer = [[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES] retain];
    
    // call it once now so we don't have to wait a second
    [self timerFired:timer];
}

//------------------------------------------------------------------------------
// timerFired
//------------------------------------------------------------------------------
- (void) timerFired:(NSTimer *)theTimer
{
    // update the displayed time left
    NSInteger secondsLeft   = [endAt timeIntervalSince1970] - [[NSDate date] timeIntervalSince1970];
    
    
    // are we there yet?
    if (secondsLeft <= 0) {
        [timer invalidate];
        [timer release];
        timer = nil;
        
        [endAt release];
        endAt = nil;
        
        [countdownLabel setStringValue:@"00:00:00"];
        
        return;
    }
    
    
    NSInteger hoursLeft     = secondsLeft / 60 / 60;
    NSInteger minutesLeft   = (secondsLeft-(hoursLeft * 60 * 60)) / 60;
    secondsLeft             = secondsLeft - (hoursLeft * 60 * 60) - (minutesLeft * 60);
    
    [countdownLabel setStringValue:[NSString stringWithFormat:@"%02d:%02d:%02d", hoursLeft, minutesLeft, secondsLeft]];
}

@end
