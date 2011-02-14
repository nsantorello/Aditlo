//
//  ApiCaller.h
//  Aditlo
//
//  Created by Noah Santorello on 2/13/11.
//  Copyright 2011 Noah Santorello. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSON.h"
#import "ResultHeaders.h"

@interface ApiCaller : NSObject {

}

+ (TodayResult*)fetchToday;

@end

@protocol ApiResponseDelegate

@optional
- (void)connectionTimedOut:(NSInteger)callType;
- (void)didFetchToday:(TodayResult*)todayResult;

@end

