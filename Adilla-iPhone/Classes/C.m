//
//  C.m
//  Aditlo
//
//  Created by Noah Santorello on 2/13/11.
//  Copyright 2011 Noah Santorello. All rights reserved.
//

#import "C.h"


@implementation C

+ (NSString*)serverString
{
	return AdillaUrl_Server;
}

+ (NSURL*)todayURL
{
	return [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", [C serverString], AdillaUrl_Today]];
}

+ (NSString*)thumbsBaseString
{
	return [NSString stringWithFormat:@"%@%@", AwsUrl_Server, AwsUrl_Thumbs];
}

+ (NSURL*)resolveThumbURL:(NSString*)url
{
	return [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", [C thumbsBaseString], url]];
}

@end
