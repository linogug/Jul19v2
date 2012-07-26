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
		
		UIButton *button = [UIButton buttonWithType: UIButtonTypeRoundedRect];
		
		NSString *title = @"Explore";
		[button setTitle: title forState: UIControlStateNormal];
		CGSize s = [title sizeWithFont: button.titleLabel.font];
		button.frame = CGRectMake(0, 0, s.width + 20, s.height + 10);
		
		//Put center of button at origin of StationView.
		button.center = CGPointMake (self.bounds.size.height/2, self.bounds.size.width/2);
		
		[button addTarget: viewController
				   action: @selector(discover)
		 forControlEvents: UIControlEventTouchUpInside
		 ];
		
		[self addSubview: button];
		
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

