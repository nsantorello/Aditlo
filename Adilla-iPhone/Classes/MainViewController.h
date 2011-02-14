//
//  MainViewController.h
//  Aditlo
//
//  Created by Noah Santorello on 2/12/11.
//  Copyright 2011 Noah Santorello. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GridTable.h"
#import "AdilTableViewController.h"
#import "ApiCaller.h"

@interface MainViewController : UIViewController<ApiResponseDelegate> {
	ApiCaller* api;
	
	// The grid table containing the image updates.
	IBOutlet GridTable* gridTable;
	// Reference to the controller so that it gets retained.
	IBOutlet AdilTableViewController* adilController;
	
	IBOutlet UINavigationBar* topNavBar;
}

// ApiResponseDelegate methods.
- (void)connectionTimedOut;
- (void)fetchedToday:(TodayResult*)todayResult;

@end
