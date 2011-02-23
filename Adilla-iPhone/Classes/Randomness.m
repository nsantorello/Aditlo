//
//  Randomness.m
//  Aditlo
//
//  Created by Noah Santorello on 2/22/11.
//  Copyright 2011 Noah Santorello. All rights reserved.
//

#import "Randomness.h"

static char letters[] = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

@implementation Randomness

+ (NSString *)randomAdilFilename
{	
	int len = 25;
	NSMutableString *randomString = [NSMutableString stringWithCapacity:len];
	
	for (int i = 0; i < len; i++) 
	{
		[randomString appendFormat: @"%c", letters[arc4random()%strlen(letters)]];
	}
	
	return [NSString stringWithFormat:@"%@%@", randomString, @".MOV"];
}

@end
