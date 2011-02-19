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
#import "AdilTableViewController.h"
#import "TodayRequest.h"

@interface MainViewController : UIViewController 
{	
	// The grid table containing the image updates.
	IBOutlet AdilTable* gridTable;
	// Reference to the controller so that it gets retained.
	IBOutlet AdilTableViewController* adilController;
	
	IBOutlet UINavigationBar* topNavBar;
}

- (IBAction)showRecordingView;

// API Request callbacks.
- (void)fetchedToday:(TodayResult*)todayResult;

@end
