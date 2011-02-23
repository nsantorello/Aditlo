//
//  Constants.m
//  Aditlo
//
//  Created by Noah Santorello on 2/13/11.
//  Copyright 2011 Noah Santorello. All rights reserved.
//

// Adilla server controller URLs.
NSString* const AdillaUrl_Today = @"today.json";

NSString* const AdillaUrl_CreateAdil = @"adils";
NSString* const AdillaUrl_CreateAdil_Video_PostKey = @"upload";

#ifdef DEV_BUILD
NSString* const AdillaUrl_Server = @"http://dev.adil.la/";
NSString* const AwsUrl_Server = @"http://dl.dev.adil.la/";
NSString* const AwsS3_UploadBucket = @"ul.dev.adil.la";
#elif TEST_BUILD
NSString* const AdillaUrl_Server = @"http://test.adil.la/";
NSString* const AwsUrl_Server = @"http://dl.test.adil.la/";
NSString* const AwsS3_UploadBucket = @"ul.test.adil.la";
#else
NSString* const AdillaUrl_Server = @"http://adil.la/";
NSString* const AwsUrl_Server = @"http://dl.adil.la/";
NSString* const AwsS3_UploadBucket = @"ul.adil.la";
#endif

// API Caller Async Downloader Keys.
NSString* const AsyncKey_Today = @"AsyncKey_Today";

// AWS Access Info.
NSString* const AwsAccessKeyId = @"AKIAJJ26WQL3CQ3X73IA";
NSString* const AwsSecretAccessKey = @"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";