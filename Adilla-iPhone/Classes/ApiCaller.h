//
//  ApiCaller.h
//  Aditlo
//
//  Created by Noah Santorello on 2/13/11.
//  Copyright 2011 Noah Santorello. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSON.h"
#import "TodayResult.h"

@interface ApiCaller : NSObject {

}

+ (void)getJsonFromUrl:(NSURL *)url;

@end
