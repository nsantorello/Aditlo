//
//  TodayRequest.h
//  Aditlo
//
//  Created by Noah Santorello on 2/19/11.
//  Copyright 2011 Noah Santorello. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TodayResult.h"
#import "RequestBase.h"

@interface TodayRequest : RequestBase 
{
}

+ (void)requestWithDelegate:(id)delegate;

@end
