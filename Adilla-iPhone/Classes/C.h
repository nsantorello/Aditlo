//
//  C.h
//  Aditlo
//
//  Created by Noah Santorello on 2/13/11.
//  Copyright 2011 Noah Santorello. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface C : NSObject {

}

// Retrieving constants.
+ (NSURL*)todayURL;

// Resolving against constants.
+ (NSURL*)resolveThumbURL:(NSString*)url;

@end
