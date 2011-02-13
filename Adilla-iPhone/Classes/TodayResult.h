//
//  TodayResult.h
//  Aditlo
//
//  Created by Noah Santorello on 2/13/11.
//  Copyright 2011 Noah Santorello. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Adil.h"

@interface TodayResult : NSObject
{
	NSMutableArray* todaysAdils;
}

@property (nonatomic, retain) NSMutableArray* todaysAdils;

- (id)initFromArray:(NSArray*)adils;

@end
