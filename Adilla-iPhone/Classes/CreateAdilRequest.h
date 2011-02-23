//
//  CreateAdilRequest.h
//  Aditlo
//
//  Created by Noah Santorello on 2/19/11.
//  Copyright 2011 Noah Santorello. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RequestBase.h"
#import "Randomness.h"

@interface CreateAdilRequest : RequestBase 
{
	NSString* videoURL;
}

+ (void)requestWithDelegate:(id)delegate andVideoURL:(NSString*)url;

@end

