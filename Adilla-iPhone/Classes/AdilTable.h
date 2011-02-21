//
//  GridTable.h
//  Aditlo
//
//  Created by Noah Santorello on 2/12/11.
//  Copyright 2011 Noah Santorello. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "AdilTableCell.h"
#import "ResultHeaders.h"
#import "ThumbDownloader.h"

@interface AdilTable : UITableView<UITableViewDelegate, UITableViewDataSource, ThumbDownloaderDelegate> {
	NSMutableArray *adilvms; // the viewmodels for each adil in the table
	NSMutableArray *adiltcvms; // the table cell view models for each adil table cell
	NSMutableDictionary *tableCells; // We store the table cells so that we don't have to redraw them.
	// We won't have a ton of rows for now, so this won't eat too much memory.
    NSMutableDictionary *thumbDownloadsInProgress;  // the set of IconDownloader objects for each adil
	
	id<AdilTableCellDelegate> tableCellDelegate; // The delegate to send to the table cells.
}

@property (nonatomic, retain) NSMutableDictionary *thumbDownloadsInProgress;
@property (nonatomic, assign) id<AdilTableCellDelegate> tableCellDelegate;

- (void)setAdils:(NSArray*)adils;

@end
