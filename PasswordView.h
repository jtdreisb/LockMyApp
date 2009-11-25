//
//  PasswordView.h
//  LockMyApp
//
//  Created by Jason Dreisbach on 11/15/09.
//  Copyright 2009 Jason Dreisbach. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface PasswordView : NSView <NSTextFieldDelegate,NSSpeechSynthesizerDelegate> {
	id _delegate;
	NSSecureTextField *password;
	NSSpeechSynthesizer *speaker;
	BOOL wrong;
}
@property (retain) NSSpeechSynthesizer *speaker;

- (void) buttonPress;
@end

@protocol PasswordViewDelegate
- (void)restore;
@end
