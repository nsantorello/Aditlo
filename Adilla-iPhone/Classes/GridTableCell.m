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
	[img1 release];
	[img2 release];
	[img3 release];
    [super dealloc];
}

// the reason I don't synthesize setters for these is because I need to 
// call -setNeedsDisplay when they change

- (void)setImg1:(UIImage*) img
{
	[img1 release];
	img1 = img;
	[img1 retain];
	[self setNeedsDisplay]; 
}

- (void)setImg2:(UIImage*) img
{
	[img2 release];
	img2 = img;
	[img2 retain];
	[self setNeedsDisplay]; 
}

- (void)setImg3:(UIImage*) img
{
	[img3 release];
	img3 = img;
	[img3 retain];
	[self setNeedsDisplay]; 
}

- (void)setImg1:(UIImage *)im1 andImg2:(UIImage*)im2 andImg3:(UIImage*)im3
{
	[self setImg1:im1];
	[self setImg2:im2];
	[self setImg3:im3];
	[self setSelectionStyle:UITableViewCellSelectionStyleNone];
}

- (void)drawContentView:(CGRect)r
{
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	UIColor *backgroundColor = [UIColor whiteColor];
	
	[backgroundColor set];
	CGContextFillRect(context, r);
	
	[img1 drawInRect:CGRectMake(2, 1, 104, 104)];
	[img2 drawInRect:CGRectMake(108, 1, 104, 104)];
	[img3 drawInRect:CGRectMake(214, 1, 104, 104)];
}

@end
