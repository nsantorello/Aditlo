//
//  MainViewController.m
//  Aditlo
//
//  Created by Noah Santorello on 2/12/11.
//  Copyright 2011 Noah Santorello. All rights reserved.
//

#import "MainViewController.h"


@implementation MainViewController

- (void)drawLogoInTopNav
{
	UIImage *headerImage = [UIImage imageNamed:@"adilla_logo.png"];
	UIImageView *headerImageView = [[UIImageView alloc] initWithImage:headerImage];
	headerImageView.contentMode = UIViewContentModeScaleAspectFit;
	CGRect headerImageRect = headerImageView.frame;
	headerImageRect.size.height = 50;
	headerImageView.frame = headerImageRect;
	topNavBar.topItem.titleView = headerImageView;
	[headerImageView release];
}

- (void)viewWillAppear:(BOOL)animated
{
	[self drawLogoInTopNav];
	
	[super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	gridTable = nil;
	gtvController = nil;
	topNavBar = nil;
    [super dealloc];
}


@end
