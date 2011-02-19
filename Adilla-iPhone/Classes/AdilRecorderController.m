//
//  AdilRecorderController.m
//  Aditlo
//
//  Created by Noah Santorello on 2/19/11.
//  Copyright 2011 Noah Santorello. All rights reserved.
//

#import "AdilRecorderController.h"


@implementation AdilRecorderController

- (id) init
{
	self = [super init];
	
	// Check to make sure you can actually record on this device.
	if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) 
	{
		self.sourceType = UIImagePickerControllerSourceTypeCamera;
		self.mediaTypes = [NSArray arrayWithObject:(NSString *)kUTTypeMovie];
	}
	else
	{
		// Camera not available! (ns): (todo): do something. :)
	}
	
	return self;
}

@end
