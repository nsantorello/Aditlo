//
//  RequestBase.m
//  Aditlo
//
//  Created by Noah Santorello on 2/19/11.
//  Copyright 2011 Noah Santorello. All rights reserved.
//

#import "RequestBase.h"


@implementation RequestBase

@synthesize delegate;

- (void)dealloc
{
	self.delegate = nil;
	
	[super dealloc];
}

@end
