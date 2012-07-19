//
//  View.m
//  Jul19
//
//  Created by Lino Guglielmo on 7/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "View.h"
#import "ViewController.h"

@implementation View

/*
 - (id) initWithFrame: (CGRect) frame
 {
 self = [super initWithFrame: frame];
 if (self) {
 // Initialization code
 }
 return self;
 }
 */

- (id) initWithFrame: (CGRect) frame controller: (ViewController *) c
{
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
		self.backgroundColor = [UIColor blackColor];
		self.font = [UIFont fontWithName: @"Courier" size: 16];
		self.editable = NO;
		viewController = c;
	}
	return self;
}


- (void) touchesEnded: (NSSet *) touches withEvent: (UIEvent *) event {
	[viewController nextStation];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void) drawRect: (CGRect) rect
{
	NSString *test = [[viewController title] stringByAppendingString: @".jpeg"];
	UIImage *image = [UIImage imageNamed: test] ;
	
	
	if (image == nil) {
		NSLog(@"could not find the image");
		return;
	}
	
	
	//upper left corner of image
	CGPoint point = CGPointMake(
								self.bounds.origin.x,self.bounds.origin.y
								);
	
	[image drawAtPoint: point];
}
@end

