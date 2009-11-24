//
//  Loader.h
//  LockMyApp
//
//  Created by Jason Dreisbach on 11/15/09.
//  Copyright 2009 Jason Dreisbach. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "PasswordView.h"

@interface Loader : NSObject {
	NSWindow *window;
	PasswordView *pWView;
	NSView *oldContentView;
}

@property (nonatomic, retain) NSWindow *window;
@property (nonatomic, retain)  PasswordView *pWView;


+ (Loader *) sharedInstance;
- (void) setup;
@end
