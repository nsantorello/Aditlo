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
	@try 
	{
		// Upload video to S3.
		NSString* randomFilename = [Randomness randomAdilFilename];
		S3PutObjectRequest *por = [[S3PutObjectRequest alloc] initWithKey:randomFilename inBucket:[C s3UploadBucket]];
		por.filename = url;
		[[C s3] putObject:por];
		
		// Signal upload to Adilla server, and pass it the location of the uploaded file.
		CreateAdilRequest* createRequest = [[CreateAdilRequest alloc] init];
		createRequest.delegate = del;
		ASIFormDataRequest* request = [ASIFormDataRequest requestWithURL:[C createAdilURL]];
		[request setDelegate:createRequest];
		[request setPostValue:[C s3UploadBucket] forKey:AdillaUrl_CreateAdil_SourceBucket_PostKey];
		[request setPostValue:randomFilename forKey:AdillaUrl_CreateAdil_SourceFile_PostKey];
		[request startAsynchronous];
	}
	@catch ( NSException* exception ) 
	{
		// Failed to create object!  Should: (todo): (ns):
		// 1. Save video so that the user can resubmit.
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
