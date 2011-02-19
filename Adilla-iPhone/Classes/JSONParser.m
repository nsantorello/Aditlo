//
//  JSONParser.m
//  Aditlo
//
//  Created by Noah Santorello on 2/19/11.
//  Copyright 2011 Noah Santorello. All rights reserved.
//

#import "JSONParser.h"

static SBJsonParser* parser = nil;

@implementation JSONParser

+ (SBJsonParser*)parser
{
	if (!parser)
	{
		// Create parser to be used for all calls.
		parser = [[SBJsonParser alloc] init];
	}
	
	return parser;
}

@end
