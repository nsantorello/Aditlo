//
//  MainViewController.m
//  Aditlo
//
//  Created by Noah Santorello on 2/12/11.
//  Copyright 2011 Noah Santorello. All rights reserved.
//

#import "MainViewController.h"


@implementation MainViewController

- (void)setupAdilTableViewController
{
	[api fetchToday];
	adilController.imageDownloadsInProgress = [NSMutableDictionary dictionary];
}

- (void)viewDidLoad
{
	api = [[ApiCaller alloc] initWithDelegate:self];
	[self setupAdilTableViewController];
	[super viewDidLoad];
}

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

- (void)connectionTimedOut
{
	// Todo: (ns): Display a message eventually (but just do nothing for now).
}

- (void)fetchedToday:(TodayResult*)todayResult
{
	[adilController setAdils:todayResult.todaysAdils];
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
	[api release];
	[gridTable release];
	[adilController release];
	[topNavBar release];
    [super dealloc];
}


@end
