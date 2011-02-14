//
//  ApiCaller.h
//  Aditlo
//
//  Created by Noah Santorello on 2/13/11.
//  Copyright 2011 Noah Santorello. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSON.h"
#import "ResultHeaders.h"
#import "AsyncDownloader.h"

@protocol  ApiResponseDelegate;

@interface ApiCaller : NSObject<AsyncDownloaderDelegate> {
	AsyncDownloader* downloader;
	id<ApiResponseDelegate> delegate;
}

@property (nonatomic, assign) id <ApiResponseDelegate> delegate;

- (id)initWithDelegate:(id)del;
- (void)fetchToday;

@end

@protocol ApiResponseDelegate<NSObject>

@optional
- (void)connectionTimedOut;
- (void)fetchedToday:(TodayResult*)todayResult;

@end

