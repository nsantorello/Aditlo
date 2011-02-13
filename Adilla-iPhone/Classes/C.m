//
//  C.m
//  Aditlo
//
//  Created by Noah Santorello on 2/13/11.
//  Copyright 2011 Noah Santorello. All rights reserved.
//

#import "C.h"


@implementation C

+ (NSURL*)serverUrl
{
	return [NSURL URLWithString:AdillaUrl_Server];
}

+ (NSURL*)todayUrl
{
	return [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", [C serverUrl], AdillaUrl_Today]];
}

@end
