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

+ (void)getJsonFromUrl:(NSURL *)url
{	
	// Prepare URL request to download statuses from Twitter
	NSURLRequest *request = [NSURLRequest requestWithURL:url];
	
	// Perform request and get JSON back as a NSData object
	NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
	
	// Get JSON as a NSString from NSData response
	NSString *json_string = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
	
	// parse the JSON response into an object
	// Here we're using NSArray since we're parsing an array of JSON status objects
	TodayResult* today = [[TodayResult alloc] initFromArray:[parser objectWithString:json_string error:nil]];
	
	// Each element in statuses is a single status
	// represented as a NSDictionary
	for (Adil *status in today.todaysAdils)
	{
		// You can retrieve individual values using objectForKey on the status NSDictionary
		// This will print the tweet and username to the console
		NSLog(@"%@ - %@ - %@", status.videoUrl, status.createdAt, status.pseudohash);
	}
}

@end
