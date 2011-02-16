//
//  GridTableCell.m
//  Aditlo
//
//  Created by Noah Santorello on 2/12/11.
//  Copyright 2011 Noah Santorello. All rights reserved.
//

#import "AdilTableCell.h"

static UIColor* nilThumbColor = nil;

@implementation AdilTableCell

@synthesize delegate;

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
	// Set selection style so you don't see blue when you select.
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

- (void)setViewModel:(AdilTableCellViewModel *)vm
{
	[adiltcvm release];
	adiltcvm = vm;
	[adiltcvm retain];
	
	// If you ever decide to reuse table cells, you'll need 
	// to call redrawImages here since we've just been assigned a new view model.
}

- (AdilTableCellViewModel*)getViewModel
{
	return adiltcvm;
}

- (void)redrawImages
{
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

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	CGPoint touch = [[touches anyObject] locationInView:self];
	// There is so little space between images in the cell that we'll ignore the whitespace.
	int x = touch.x;
	// Fire button click events.
	if (x < 108)
	{
		[delegate performedViewAction:adiltcvm.adilvm1];
	}
	else if (x < 214)
	{
		[delegate performedViewAction:adiltcvm.adilvm2];
	}
	else
	{
		[delegate performedViewAction:adiltcvm.adilvm3];
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
