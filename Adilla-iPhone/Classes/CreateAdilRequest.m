//
//  CreateAdilRequest.m
//  Aditlo
//
//  Created by Noah Santorello on 2/19/11.
//  Copyright 2011 Noah Santorello. All rights reserved.
//

#import "CreateAdilRequest.h"

@implementation CreateAdilRequest

+ (void)requestWithDelegate:(id)del andVideoURL:(NSString*)url
{
	/*CreateAdilRequest* createRequest = [[CreateAdilRequest alloc] init];
	createRequest.delegate = del;
	ASIFormDataRequest* request = [ASIFormDataRequest requestWithURL:[C createAdilURL]];
	[request setDelegate:createRequest];
	[request setFile:url forKey:AdillaUrl_CreateAdil_Video_PostKey];
	[request startAsynchronous];*/
	
	@try 
	{
		S3PutObjectRequest *por = [[S3PutObjectRequest alloc] initWithKey:[Randomness randomAdilFilename] inBucket:[C s3UploadBucket]];
		por.filename = url;
		
		[[C s3] putObject:por];
	}
	@catch ( NSException* exception ) 
	{
		NSLog( @"Failed to Create Object [%@]", exception );
	}
}

- (void)requestFinished:(ASIHTTPRequest*)request
{
	if ([delegate respondsToSelector:@selector(createdAdil)])
	{
		[delegate performSelector:@selector(createdAdil)];
	}
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
