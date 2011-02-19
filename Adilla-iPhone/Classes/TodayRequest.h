//
//  TodayRequest.h
//  Aditlo
//
//  Created by Noah Santorello on 2/19/11.
//  Copyright 2011 Noah Santorello. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TodayResult.h"
#import "JSONParser.h"

@interface TodayRequest : NSObject 
{
	id delegate;
}

@property (nonatomic, retain) id delegate;

+ (void)fetchTodayWithDelegate:(id)delegate;

@end
