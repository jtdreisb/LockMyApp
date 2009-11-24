//
//  PasswordView.m
//  LockMyApp
//
//  Created by Jason Dreisbach on 11/15/09.
//  Copyright 2009 Jason Dreisbach. All rights reserved.
//

#import "PasswordView.h"


@implementation PasswordView
@synthesize speaker;
- (void)textDidChange:(NSNotification *)aNotification
{
	
}

- (id)initWithSpeaker:(NSSpeechSynthesizer *) speak frame:(NSRect)frame {
	self = [self initWithFrame:frame];
	self.speaker = speak;
	return self;
}
a
- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
		wrong = NO;
		NSTextField *label = [[NSTextField alloc] initWithFrame:NSMakeRect(30, 93, 95, 85)];
		[label setEditable:NO];
		[label setSelectable:NO];
		[label setDrawsBackground:NO];
		[label setBezeled:NO];
		[label setTitleWithMnemonic:@"You have been hacked! For $5 I'll give you the Password."];
		
		password = [[NSSecureTextField	alloc] initWithFrame:NSMakeRect(30, 61, 95, 22)];
		[password setDelegate:self];
		
		
		NSButton *button = [[NSButton alloc] initWithFrame:NSMakeRect(30, 20, 95, 22)];
		[button setTitle:@"OK!"];
		[button setAction:@selector(buttonPress)];
		//password set
		[self addSubview:label];
		[self addSubview:button];
		[self addSubview:password];
    }
    return self;
}
- (void) buttonPress {
	if ([[password stringValue] isEqualToString:@"Faggot"]) {
		[speaker startSpeakingString:@"Yes, You are a Fag"];
	} else {
		[speaker startSpeakingString:[NSString stringWithFormat:@"%@ was not the code, You Fag get",[password stringValue]]];
		wrong = YES;
		[speaker setDelegate:self];
	}
}
- (void) speechSynthesizer:(NSSpeechSynthesizer *)sender didFinishSpeaking:(BOOL)finishedSpeaking {
	if (wrong) {
		[NSApp terminate:self];
	}
}

- (void)drawRect:(NSRect)dirtyRect {
    // Drawing code here.
}

@end
