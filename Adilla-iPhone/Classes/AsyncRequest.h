//
//  AsyncDownloader.h
//  Aditlo
//
//  Created by Noah Santorello on 2/13/11.
//  Copyright 2011 Noah Santorello. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"

@protocol AsyncDownloaderDelegate;

@interface AsyncRequest : NSObject 
{
    NSObject* key;
    id <AsyncDownloaderDelegate> delegate;
    
    NSMutableData *activeDownload;
    ASIHTTPRequest *request;
}

@property (nonatomic, retain) NSObject *key;
@property (nonatomic, assign) id <AsyncDownloaderDelegate> delegate;

@property (nonatomic, retain) NSMutableData *activeDownload;
@property (nonatomic, retain) ASIHTTPRequest *request;

- (id)initWithDelegate:(id)del;
- (void)start:(NSURL*)url forKey:(NSObject*)dlKey;
- (void)cancel;

@end

@protocol AsyncDownloaderDelegate<NSObject>

- (void)requestFinished:(ASIHTTPRequest*)request forKey:(NSObject*)key;
- (void)requestFailedForKey:(NSObject*)key;

@end