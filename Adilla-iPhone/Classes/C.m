//
//  C.m
//  Aditlo
//
//  Created by Noah Santorello on 2/13/11.
//  Copyright 2011 Noah Santorello. All rights reserved.
//

#import "C.h"

static AmazonS3Client* s3 = nil;

@implementation C

+(AmazonS3Client*)s3 {
	if ( s3 == nil ) {
		s3 = [[AmazonS3Client alloc] initWithAccessKey:AwsAccessKeyId withSecretKey:AwsSecretAccessKey];
	}
	return s3;
}

+ (NSString*)s3UploadBucket
{
	return AwsS3_UploadBucket;
}

+ (NSString*)serverString
{
	return AdillaUrl_Server;
}

+ (NSURL*)todayURL
{
	return [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", [C serverString], AdillaUrl_Today]];
}

+ (NSURL*)createAdilURL
{
	return [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", [C serverString], AdillaUrl_CreateAdil]];
}

+ (NSURL*)resolveThumbURL:(NSString*)url
{
	return [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", AwsUrl_Server, url]];
}

+ (NSURL*)resolveAdilURL:(NSString*)url
{
	return [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", AwsUrl_Server, url]];
}

@end
