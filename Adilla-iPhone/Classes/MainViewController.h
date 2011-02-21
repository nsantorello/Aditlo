//
//  MainViewController.h
//  Aditlo
//
//  Created by Noah Santorello on 2/12/11.
//  Copyright 2011 Noah Santorello. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdilRecorderController.h"
#import "AdilTable.h"
#import "RequestHeaders.h"

@interface MainViewController : UIViewController<AdilTableCellDelegate>
{	
	// The grid table containing the image updates.
	IBOutlet AdilTable* adilTable;
	
	IBOutlet UINavigationBar* topNavBar;
}

- (IBAction)showRecordingView;
- (IBAction)refreshAdils;

// API Request callbacks.
- (void)fetchedToday:(TodayResult*)todayResult;

// Adil table cell delegate.
- (void)performedViewAction:(AdilViewModel *)adilViewModel;

@end
