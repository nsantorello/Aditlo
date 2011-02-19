//
//  AsyncDownloader.m
//  Aditlo
//
//  Created by Noah Santorello on 2/13/11.
//  Copyright 2011 Noah Santorello. All rights reserved.
//

#import "AsyncDownloader.h"

@implementation AsyncDownloader

@synthesize key;
@synthesize delegate;
@synthesize activeDownload;
@synthesize request;

#pragma mark

- (id)initWithDelegate:(id)del
{
	self = [super init];
	self.delegate = del;
	return self;
}

- (void)dealloc
{
    [key release];
    
    [activeDownload release];
    
    [request cancel];
    [request release];
    
    [super dealloc];
}

- (void)requestFinished:(ASIHTTPRequest *)req
{
	// Signal that download finished.
	if ([delegate respondsToSelector:@selector(requestFinished:forKey:)])
	{
		[delegate requestFinished:req forKey:key];
	}
}

- (void)requestFailed:(ASIHTTPRequest *)request
{	
	// Signal that download failed.
	if ([delegate respondsToSelector:@selector(requestFailedForKey:)])
	{
		[delegate requestFailedForKey:key];
	}
}

- (void)start:(NSURL*)url forKey:(NSObject*)dlKey
{
	// Cancel any currently in progress download for this downloader before starting another.
	[self cancel];
	self.key = dlKey;
	
	self.request = [ASIHTTPRequest requestWithURL:url];
	[request setDelegate:self];
	[request startAsynchronous];
}

- (void)cancel
{
    [request cancel];
    self.request = nil;
    self.activeDownload = nil;
	self.key = nil;
}

@end