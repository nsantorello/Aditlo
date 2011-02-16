//
//  GridTableViewController.h
//  Aditlo
//
//  Created by Noah Santorello on 2/12/11.
//  Copyright 2011 Noah Santorello. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdilTableCell.h"
#import "ResultHeaders.h"
#import "IconDownloader.h"

@interface AdilTableViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource, 
											IconDownloaderDelegate, AdilTableCellDelegate> {
	NSMutableArray *adilvms; // the viewmodels for each adil in the table
	NSMutableArray *adiltcvms; // the table cell view models for each adil table cell
    NSMutableDictionary *imageDownloadsInProgress;  // the set of IconDownloader objects for each adil
}

@property (nonatomic, retain) NSMutableDictionary *imageDownloadsInProgress;

- (void)setAdils:(NSArray*)adils;
- (void)startIconDownload:(AdilViewModel *)adilvm forIndex:(NSNumber *)indexPath;

// AdilTableCellDelegate methods.
- (void)performedViewAction:(AdilViewModel *)adilViewModel;

@end
