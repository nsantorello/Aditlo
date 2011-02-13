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

NSString* const AdillaUrl_Server = @"http://adil.la/";
NSString* const AdillaUrl_Today = @"today.json";

#ifdef DEV_CONSTANTS
NSString* const AwsDistUrl_Server = @"";//http://dl-dev.adil.la.s3.amazonaws.com/";
NSString* const AwsDistUrl_Thumbs = @"";//@"thumbs/";
NSString* const AwsDistUrl_Adils = @"";//@"adils/";
#else
NSString* const AwsDistUrl_Server = @"http://dl.adil.la.s3.amazonaws.com/";
NSString* const AwsDistUrl_Thumbs = @"thumbs/";
NSString* const AwsDistUrl_Adils = @"adils/";
#endif