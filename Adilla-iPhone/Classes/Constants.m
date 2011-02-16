//
//  Constants.m
//  Aditlo
//
//  Created by Noah Santorello on 2/13/11.
//  Copyright 2011 Noah Santorello. All rights reserved.
//

// Adilla server controller URLs.
NSString* const AdillaUrl_Today = @"today.json";

// AWS content type paths.
NSString* const AwsUrl_Thumbs = @"t/"; // t for thumbs!
NSString* const AwsUrl_Adils = @"a/"; // a for adils!

#ifdef DEV_BUILD
NSString* const AdillaUrl_Server = @"http://pnqyo.com/";//@"http://dev.adil.la";
NSString* const AwsUrl_Server = @"http://dl.dev.adil.la/";
#elif TEST_BUILD
NSString* const AdillaUrl_Server = @"http://test.adil.la/";
NSString* const AwsUrl_Server = @"http://dl.test.adil.la/";
#else
NSString* const AdillaUrl_Server = @"http://adil.la/";
NSString* const AwsUrl_Server = @"http://dl.adil.la/";
#endif

// API Caller Async Downloader Keys.
NSString* const AsyncKey_Today = @"AsyncKey_Today";