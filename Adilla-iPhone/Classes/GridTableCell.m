//
//  GridTableCell.m
//  Aditlo
//
//  Created by Noah Santorello on 2/12/11.
//  Copyright 2011 Noah Santorello. All rights reserved.
//

#import "GridTableCell.h"

@implementation GridTableCell

- (void)dealloc
{
	[adiltcvm release];
    [super dealloc];
}

// the reason I don't synthesize setters for these is because I need to 
// call -setNeedsDisplay when they change

- (void)setAdilTableCellViewModel:(AdilTableCellViewModel *)vm
{
	[adiltcvm release];
	adiltcvm = vm;
	[adiltcvm retain];
	[self setNeedsDisplay];
}

- (void)drawContentView:(CGRect)r
{
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	UIColor *backgroundColor = [UIColor whiteColor];
	
	[backgroundColor set];
	CGContextFillRect(context, r);
	
	[adiltcvm.adilvm1.thumb104 drawInRect:CGRectMake(2, 1, 104, 104)];
	[adiltcvm.adilvm2.thumb104 drawInRect:CGRectMake(108, 1, 104, 104)];
	[adiltcvm.adilvm3.thumb104 drawInRect:CGRectMake(214, 1, 104, 104)];
}

@end
