//
//  Controller.h
//  Countdown
//
//  Created by Brian Cooke on 6/12/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Controller : NSObject {
    IBOutlet NSTextField *  minutesToCountTextField;
    IBOutlet NSTextField *  countdownLabel;
    
    NSDate *                endAt;
    NSTimer *               timer;
}

- (IBAction) countdown:(id)sender;


@end
