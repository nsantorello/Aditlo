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
	// Remove any previous requests if they exist.
	[request cancel];
	[request release];
	
}

- (void)requestFinished:(ASIHTTPRequest*)request forKey:(NSObject*)key
{

}

- (void)requestFailedForKey:(NSObject*)key
{
	
}

- (void)dealloc
{
	[request release];
	[videoURL release];
	[super dealloc];
}

@end
