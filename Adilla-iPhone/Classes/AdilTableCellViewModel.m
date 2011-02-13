//
//  AdilTableCellViewModel.m
//  Aditlo
//
//  Created by Noah Santorello on 2/13/11.
//  Copyright 2011 Noah Santorello. All rights reserved.
//

#import "AdilTableCellViewModel.h"


@implementation AdilTableCellViewModel

@synthesize adilvm1, adilvm2, adilvm3;

- (id)initWithAdil1:(AdilViewModel*)a1 andAdil2:(AdilViewModel*)a2 andAdil3:(AdilViewModel*)a3
{
	self = [super init];
	self.adilvm1 = a1;
	self.adilvm2 = a2;
	self.adilvm3 = a3;
	return self;
}

- (void)dealloc
{
	[adilvm1 release];
	[adilvm2 release];
	[adilvm3 release];
	[super dealloc];
}

@end
