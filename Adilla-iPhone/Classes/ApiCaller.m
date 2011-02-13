//
//  ApiCaller.m
//  Aditlo
//
//  Created by Noah Santorello on 2/13/11.
//  Copyright 2011 Noah Santorello. All rights reserved.
//

#import "ApiCaller.h"

// JSON Parser used to parse downloaded JSON into NSDictionaries.
static SBJsonParser *parser = nil;

@implementation ApiCaller

+ (void)initialize
{
	if (!parser)
	{
		// Create parser to be used for all calls.
		parser = [[SBJsonParser alloc] init];
	}
}

+ (TodayResult*)fetchToday
{	
	// Prepare URL request to download statuses from Twitter
	NSURLRequest *request = [NSURLRequest requestWithURL:[C todayURL]];
	
	// Perform request and get JSON back as a NSData object
	NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
	
	// Get JSON as a NSString from NSData response
	NSString *json_string = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
	
	// parse the JSON response into an object
	TodayResult* today = [[TodayResult alloc] initFromArray:[parser objectWithString:json_string error:nil]];
	return today;
}

@end
