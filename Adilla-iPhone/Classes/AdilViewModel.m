//
//  AdilViewModel.m
//  Aditlo
//
//  Created by Noah Santorello on 2/13/11.
//  Copyright 2011 Noah Santorello. All rights reserved.
//

#import "AdilViewModel.h"


@implementation AdilViewModel

@synthesize adil, thumb104, thumb208;

- (id)initWithAdil:(Adil *)ad
{
	self = [super init];
	self.adil = ad;
	NSString* thumbUrl = [[C resolveThumbURL:ad.thumb104] absoluteString];
	self.thumb104 = [UIImage imageNamed:thumbUrl];
	return self;
}

- (void)dealloc
{
	[adil release];
	[thumb104 release];
	[thumb208 release];
	[super dealloc];
}

@end
