//
//  ApiCaller.m
//  Aditlo
//
//  Created by Noah Santorello on 2/13/11.
//  Copyright 2011 Noah Santorello. All rights reserved.
//

#import "ApiCaller.h"

// JSON Parser used to parse downloaded JSON into NSDictionaries.
static SBJsonParser* parser = nil;

@implementation ApiCaller

@synthesize delegate;

+ (void)initialize
{
	if (!parser)
	{
		// Create parser to be used for all calls.
		parser = [[SBJsonParser alloc] init];
	}
}

- (id)init
{
	self = [super init];
	downloader = [[AsyncDownloader alloc] init];
	downloader.delegate = self;
	return self;
}

- (id)initWithDelegate:(id)del
{
	self = [self init];
	self.delegate = del;
	return self;
}

- (void)fetchToday
{
	[downloader start:[C todayURL] forKey:AsyncKey_Today];
}

- (void)parseToday:(NSData*)dledData
{
	// Get JSON as a NSString from NSData response
	NSString *json_string = [[NSString alloc] initWithData:dledData encoding:NSUTF8StringEncoding];
	
	// parse the JSON response into an object
	TodayResult* today = [[TodayResult alloc] initFromArray:[parser objectWithString:json_string error:nil]];
	
	if ([delegate respondsToSelector:@selector(fetchedToday:)])
	{
		[delegate fetchedToday:today];
	}
}

- (void)requestFinished:(ASIHTTPRequest*)request forKey:(NSObject*)key
{
	NSData* dledData = [request responseData];
	// Go through each key to see which type of call we should handle.
	if (key == AsyncKey_Today)
	{
		[self parseToday:dledData];
	}
}

- (void)requestFailedForKey:(NSObject*)key
{
	if ([delegate respondsToSelector:@selector(connectionTimedOut:)])
	{
		[delegate connectionTimedOut];
	}
}

- (void)dealloc
{
	[downloader cancel];
	[downloader release];
	[super dealloc];
}

@end
