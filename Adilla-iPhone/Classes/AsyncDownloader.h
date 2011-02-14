//
//  AsyncDownloader.h
//  Aditlo
//
//  Created by Noah Santorello on 2/13/11.
//  Copyright 2011 Noah Santorello. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AsyncDownloaderDelegate;

@interface AsyncDownloader : NSObject 
{
    NSObject* key;
    id <AsyncDownloaderDelegate> delegate;
    
    NSMutableData *activeDownload;
    NSURLConnection *dlConnection;
}

@property (nonatomic, retain) NSObject *key;
@property (nonatomic, assign) id <IconDownloaderDelegate> delegate;

@property (nonatomic, retain) NSMutableData *activeDownload;
@property (nonatomic, retain) NSURLConnection *dlConnection;

- (void)startDownload:(NSURL*)url withKey:(NSObject*)dlKey;
- (void)cancelDownload;

@end

@protocol AsyncDownloaderDelegate<NSObject>

- (void)didDownload:(NSData*)dledData forKey:(NSObject*)key;
- (void)downloadFailedForKey:(NSObject*)key;

@end