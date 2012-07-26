//
//  InfoView.m
//  Jul19
//
//  Created by Lino Guglielmo on 7/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "InfoView.h"

@implementation InfoView

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

- (id) initWithFrame: (CGRect) frame information: (NSString *) information
{
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
		self.backgroundColor = [UIColor yellowColor];
		self.font = [UIFont systemFontOfSize: 24];
		self.text = information;
		self.editable = NO;
			
		UIWebView *webView = [[UIWebView alloc] initWithFrame: self.bounds];
		//self = webView;
		webView.scalesPageToFit = YES;
		
		
	
		NSURL *webUrl = [NSURL URLWithString: information];
		NSData *data = [NSData dataWithContentsOfURL: webUrl];
		
		//if (data == nil) {
		//	NSLog(@"could not load URL %@", webUrl);
	//		return YES;
	//	}
		[webView loadData: data MIMEType: @"text/html" textEncodingName: @"NSUTF8StringEncoding" baseURL: webUrl];		
		
		[self.window makeKeyAndVisible];
	}
	return self;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void) drawRect: (CGRect) rect
 {
 // Drawing code
 }
 */

@end
