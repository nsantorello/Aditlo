//
//  GridTableViewController.h
//  Aditlo
//
//  Created by Noah Santorello on 2/12/11.
//  Copyright 2011 Noah Santorello. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GridTableCell.h"
#import "ApiCaller.h"
#import "ResultHeaders.h"

@interface AdilTableViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource> {
	NSMutableArray *adilvms; // the viewmodels for each adil in the table
	NSMutableArray *adiltcvms; // the table cell view models for each adil table cell
    NSMutableDictionary *imageDownloadsInProgress;  // the set of IconDownloader objects for each adil
}

@property (nonatomic, retain) NSMutableDictionary *imageDownloadsInProgress;

- (void)setAdils:(NSArray*)adils;

@end
