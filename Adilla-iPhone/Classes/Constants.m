//
//  Constants.m
//  Aditlo
//
//  Created by Noah Santorello on 2/13/11.
//  Copyright 2011 Noah Santorello. All rights reserved.
//

#ifdef DEV_BUILD
#define DEV_CONSTANTS 1
#endif

// URL connection constants.
NSString* const AdillaUrl_Today = @"today.json";

#ifdef DEV_CONSTANTS
NSString* const AdillaUrl_Server = @"http://pnqyo.com/";//@"http://adil.la/";//@"http://dev.adil.la";
NSString* const AwsUrl_Server = @"http://dl-dev.adil.la.s3.amazonaws.com/";
NSString* const AwsUrl_Thumbs = @"thumbs/";
NSString* const AwsUrl_Adils = @"adils/";
#else
NSString* const AdillaUrl_Server = @"http://adil.la/";
NSString* const AwsUrl_Server = @"http://dl.adil.la.s3.amazonaws.com/";
NSString* const AwsUrl_Thumbs = @"thumbs/";
NSString* const AwsUrl_Adils = @"adils/";
#endif

// API Caller Async Downloader Keys.
NSString* const AsyncKey_Today = @"AsyncKey_Today";