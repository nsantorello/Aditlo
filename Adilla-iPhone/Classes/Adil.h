//
//  Adil.h
//  Aditlo
//
//  Created by Noah Santorello on 2/13/11.
//  Copyright 2011 Noah Santorello. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Adil : NSObject {
	NSString* videoUrl;
	NSString* pseudohash;
	NSString* thumb104;
	NSString* thumb208;
	NSDate* createdAt;
}

@property (nonatomic, retain) NSString* videoUrl;
@property (nonatomic, retain) NSString* pseudohash;
@property (nonatomic, retain) NSString* thumb104;
@property (nonatomic, retain) NSString* thumb208;
@property (nonatomic, retain) NSDate* createdAt;

@end
