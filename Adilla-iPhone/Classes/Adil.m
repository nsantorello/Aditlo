//
//  Adil.m
//  Aditlo
//
//  Created by Noah Santorello on 2/13/11.
//  Copyright 2011 Noah Santorello. All rights reserved.
//

#import "Adil.h"


@implementation Adil

@synthesize videoUrl, pseudohash, thumb104, thumb208, createdAt;

- (id)initWithDictionary:(NSDictionary*)dictionary
{
	self = [super init];
	self.videoUrl = [dictionary objectForKey:@"video_url"];
	self.pseudohash = [dictionary objectForKey:@"pseudohash"];
	self.thumb104 = [dictionary objectForKey:@"thumb_104"];
	self.thumb208 = [dictionary objectForKey:@"thumb_208"];
	self.createdAt = [dictionary objectForKey:@"created_at"];
	return self;
}

- (NSString*)description
{
	return [NSString stringWithFormat:@"Adil Instance\nvideoUrl:%@\npseudohash:%@\nthumb104:%@\nthumb208:%@\ncreatedAt:%@",
			videoUrl, pseudohash, thumb104, thumb208, createdAt];
}

- (void)dealloc
{
	[videoUrl release];
	[pseudohash release];
	[thumb104 release];
	[thumb208 release];
	[createdAt release];
	[super dealloc];
}

@end
