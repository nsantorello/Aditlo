//
//  GridTableCell.m
//  Aditlo
//
//  Created by Noah Santorello on 2/12/11.
//  Copyright 2011 Noah Santorello. All rights reserved.
//

#import "GridTableCell.h"

static UIColor* nilThumbColor = nil;

@implementation GridTableCell

+ (void)initialize
{
	if (!nilThumbColor)
	{
		// Create parser to be used for all calls.
		nilThumbColor = [[UIColor alloc] initWithRed:0.9 green:0.9 blue:0.9 alpha:1];
	}
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	[self setSelectionStyle:UITableViewCellSelectionStyleNone];
	return self;
}

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

- (void)drawThumbOrBlank:(UIImage*)img inRect:(CGRect)rect inContext:(CGContextRef)context
{
	if (img == nil)
	{
		[nilThumbColor set];
		CGContextFillRect(context, rect);
	}
	else 
	{
		[img drawInRect:rect];
	}
}

- (void)drawContentView:(CGRect)r
{
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	UIColor *backgroundColor = [UIColor whiteColor];
	
	[backgroundColor set];
	CGContextFillRect(context, r);
	
	CGRect rect1 = CGRectMake(2, 1, 104, 104);
	CGRect rect2 = CGRectMake(108, 1, 104, 104);
	CGRect rect3 = CGRectMake(214, 1, 104, 104);
	
	[self drawThumbOrBlank:adiltcvm.adilvm1.thumb104 inRect:rect1 inContext:context];
	[self drawThumbOrBlank:adiltcvm.adilvm2.thumb104 inRect:rect2 inContext:context];
	[self drawThumbOrBlank:adiltcvm.adilvm3.thumb104 inRect:rect3 inContext:context];
}

@end
