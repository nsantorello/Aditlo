//
//  CreateAdilRequest.h
//  Aditlo
//
//  Created by Noah Santorello on 2/19/11.
//  Copyright 2011 Noah Santorello. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AsyncRequest.h"

@interface CreateAdilRequest : NSObject 
{
	ASIHTTPRequest* request;
	NSString* videoURL;
}

@end
