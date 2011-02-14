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
@synthesize dlConnection;

#pragma mark

- (void)dealloc
{
    [key release];
    
    [activeDownload release];
    
    [dlConnection cancel];
    [dlConnection release];
    
    [super dealloc];
}

- (void)startDownload:(NSURL*)url withKey:(NSObject*)dlKey withDelegate:(id)del;
{
    self.activeDownload = [NSMutableData data];
	self.key = dlKey;
	self.delegate = del;
    // alloc+init and start an NSURLConnection; release on completion/failure
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:
                             [NSURLRequest requestWithURL:url] delegate:self];
    self.dlConnection = conn;
    [conn release];
}

- (void)cancelDownload
{
    [self.dlConnection cancel];
    self.dlConnection = nil;
    self.activeDownload = nil;
	self.key = nil;
}


#pragma mark -
#pragma mark Download support (NSURLConnectionDelegate)

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.activeDownload appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
	// Signal that download failed.
	if ([delegate respondsToSelector:@selector(downloadFailedForKey:)])
	{
		[delegate downloadFailedForKey:key];
	}
	
	// Release resources now that we're finished.
	[self cancelDownload];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{    	
    // Signal that download is complete.
	if ([delegate respondsToSelector:@selector(didDownload:forKey:)])
	{
		[delegate didDownload:activeDownload forKey:key];
	}
	
	// Release resources now that we're finished.
	[self cancelDownload];
}

@end