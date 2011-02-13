//
//  TodayResult.m
//  Aditlo
//
//  Created by Noah Santorello on 2/13/11.
//  Copyright 2011 Noah Santorello. All rights reserved.
//

#import "TodayResult.h"


@implementation TodayResult

@synthesize todaysAdils;

- (id)initFromArray:(NSArray*)adils
{
	self = [super init];
	self.todaysAdils = [[NSMutableArray alloc] init];
	
	for (NSDictionary* adilJson in adils)
	{
		Adil* adil = [[Adil alloc] initWithDictionary:[adilJson objectForKey:@"adil"]];
		[todaysAdils addObject:adil];
		[adil release];
	}
	
	return self;
}

- (void)dealloc
{
	[todaysAdils release];
	[super dealloc];
}

@end
