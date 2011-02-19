//
//  CreateAdilRequest.m
//  Aditlo
//
//  Created by Noah Santorello on 2/19/11.
//  Copyright 2011 Noah Santorello. All rights reserved.
//

#import "CreateAdilRequest.h"

@implementation CreateAdilRequest

- (void)beginRequestWithVideoURL:(NSString*)url
{
	ASIFormDataRequest* request = [ASIFormDataRequest requestWithURL:[C createAdilURL]];
	[request setDelegate:self];
	[request setFile:url forKey:AdillaUrl_CreateAdil_Video_PostKey];
	[request startAsynchronous];
}

- (void)requestFinished:(ASIHTTPRequest*)request
{
	
}

- (void)requestFailed:(ASIHTTPRequest*)request
{
	
}

- (void)dealloc
{
	[videoURL release];
	[super dealloc];
}

@end
