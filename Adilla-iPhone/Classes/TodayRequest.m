//
//  TodayRequest.m
//  Aditlo
//
//  Created by Noah Santorello on 2/19/11.
//  Copyright 2011 Noah Santorello. All rights reserved.
//

#import "TodayRequest.h"


@implementation TodayRequest

@synthesize delegate;

+ (void)fetchTodayWithDelegate:(id)del
{
	TodayRequest* today = [[TodayRequest alloc] init];
	today.delegate = del;
	ASIHTTPRequest* request = [ASIHTTPRequest requestWithURL:[C todayURL]];
	[request setDelegate:today];
	[request startAsynchronous];
}

- (void)requestFinished:(ASIHTTPRequest*)request
{
	if ([delegate respondsToSelector:@selector(fetchedToday:)])
	{
		// Get JSON as a NSString from NSData response
		NSData* dledData = [request responseData];
		NSString *json_string = [[NSString alloc] initWithData:dledData encoding:NSUTF8StringEncoding];
		
		// parse the JSON response into an object
		TodayResult* today = [[TodayResult alloc] initFromArray:[[JSONParser parser] objectWithString:json_string error:nil]];
		
		[delegate performSelector:@selector(fetchedToday:) withObject:today];
		
		[today release];
	}
}

- (void)requestFailed:(ASIHTTPRequest*)request
{
	
}

@end
