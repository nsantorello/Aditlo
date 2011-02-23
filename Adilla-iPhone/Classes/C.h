//
//  C.h
//  Aditlo
//
//  Created by Noah Santorello on 2/13/11.
//  Copyright 2011 Noah Santorello. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"
#import <AWSiOSSDK/S3/AmazonS3Client.h>

@interface C : NSObject {

}
// Amazon API objects.
+ (AmazonS3Client*)s3;
+ (NSString*)s3UploadBucket;

// Retrieving constants.
+ (NSURL*)todayURL;
+ (NSURL*)createAdilURL;

// Resolving against constants.
+ (NSURL*)resolveThumbURL:(NSString*)url;
+ (NSURL*)resolveAdilURL:(NSString*)url;

@end
