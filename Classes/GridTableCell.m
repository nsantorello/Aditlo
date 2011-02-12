//
//  GridTableCell.m
//  Aditlo
//
//  Created by Noah Santorello on 2/12/11.
//  Copyright 2011 Infusion Development. All rights reserved.
//

#import "GridTableCell.h"

@implementation GridTableCell

@synthesize img1, img2, img3;

- (void)dealloc {
	[img1 release];
	[img2 release];
	[img3 release];
    [super dealloc];
}


@end
