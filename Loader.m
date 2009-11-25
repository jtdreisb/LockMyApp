//
//  Loader.m
//  LockMyApp
//
//  Created by Jason Dreisbach on 11/15/09.
//  Copyright 2009 Jason Dreisbach. All rights reserved.
//

#import "Loader.h"


@implementation Loader
@synthesize window, pWView;

+ (void) load {
	Loader *loader = [Loader sharedInstance];
	[loader setup];
}
- (void) setup {
	NSSpeechSynthesizer *speaker = [[NSSpeechSynthesizer alloc] init];
	[speaker startSpeakingString:@"hello"];
	pWView = [[PasswordView alloc] initWithFrame:NSMakeRect(20, 20, 130, 150)];
	
	[pWView setSpeaker:speaker];
	window = nil;
	[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(checkWindow) userInfo:nil repeats:NO];
	window = [NSApp mainWindow];
	
}

- (void) checkWindow {
	window = [NSApp mainWindow];
	[NSApp hideOtherApplications:self];		//just to be annoying
	
	if (window == nil) {
		//no main window so we check again
		[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(checkWindow) userInfo:nil repeats:NO]; 
	}
	else {
		//Override the window
		[window center];
		[window	makeKeyAndOrderFront:self];
		[window setCanHide:NO]; 
		[window setMovable:NO];
		
		//save what was displaying in the window
		oldContentView = [window contentView];
		[[window contentView] removeFromSuperview];
		
		[window	setStyleMask:0];
		[window setFrame:NSMakeRect(849, 525, 156, 196) display:YES];
		
		//set new content view
		[window setContentView:pWView];
	}

}
+ (Loader *) sharedInstance {
	static Loader * loader = nil;
	
	if(!loader)
	{
		loader = [[Loader alloc] init];
		
	}
	
	return loader;
}
@end
