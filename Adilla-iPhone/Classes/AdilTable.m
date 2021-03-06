//
//  GridTable.m
//  Aditlo
//
//  Created by Noah Santorello on 2/12/11.
//  Copyright 2011 Noah Santorello. All rights reserved.
//

#import "AdilTable.h"


@implementation AdilTable

@synthesize thumbDownloadsInProgress, tableCellDelegate;

- (void)setAdilViewModels:(NSArray*)adils
{
	int numAdils = [adils count];
	
	// Compute new viewmodels.
	[adilvms release];
	adilvms = [[NSMutableArray alloc] init];
	
	// Create viewmodels for each adil.
	for (int i = 0; i < numAdils; i++)
	{
		Adil* adil = [adils objectAtIndex:i];
		AdilViewModel* adilvm = [[AdilViewModel alloc] initWithAdil:adil];
		[adilvms addObject:adilvm];
		[adilvm release];
	}
}

- (void)setAdilTableCellViewModels:(NSArray*)adilViewModels
{
	int numAdils = [adilViewModels count];
	
	// Create tablecell viewmodels for every 3 AdilViewModels.
	[adiltcvms release];
	adiltcvms = [[NSMutableArray alloc] init];
	
	int numTableCellViewModels = (int)ceil([adilViewModels count] / 3.0);
	for (int i = 0; i < numTableCellViewModels; i++)
	{
		AdilViewModel* avm1 = [adilViewModels objectAtIndex:(i * 3)];
		AdilViewModel* avm2 = (i * 3) + 1 < numAdils ? [adilViewModels objectAtIndex:(i * 3) + 1] : nil;
		AdilViewModel* avm3 = (i * 3) + 2 < numAdils ? [adilViewModels objectAtIndex:(i * 3) + 2] : nil;
		AdilTableCellViewModel* adiltcvm = [[AdilTableCellViewModel alloc] initWithAdil1:avm1 andAdil2:avm2 andAdil3:avm3];
		[adiltcvms addObject:adiltcvm];
		[adiltcvm release];
	}
}

- (void)setAdils:(NSArray *)adils
{	
	[tableCells release];
	tableCells = [[NSMutableDictionary alloc] init];
	
	[thumbDownloadsInProgress removeAllObjects];
	[thumbDownloadsInProgress release];
	thumbDownloadsInProgress = [[NSMutableDictionary alloc] init];
	
	[self setAdilViewModels:adils];
	
	[self setAdilTableCellViewModels:adilvms];
	
	[self reloadData];
}

- (void)startThumbDownload:(AdilViewModel *)adilvm forIndex:(NSNumber *)index
{
    ThumbDownloader *thumbDownloader = [thumbDownloadsInProgress objectForKey:index];
    if (thumbDownloader == nil) 
    {
        thumbDownloader = [[ThumbDownloader alloc] init];
        thumbDownloader.adilvm = adilvm;
        thumbDownloader.index = index;
        thumbDownloader.delegate = self;
        [thumbDownloadsInProgress setObject:thumbDownloader forKey:index];
        [thumbDownloader startDownload];
        [thumbDownloader release];   
    }
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return adiltcvms != nil ? [adiltcvms count] : 0;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"AdilTableCell";
    
	int row = indexPath.row;
	AdilTableCellViewModel* adiltcvm = [adiltcvms objectAtIndex:row];
	
	AdilTableCell* cell = [tableCells objectForKey:indexPath];
    if (cell == nil) {
		cell = [[[AdilTableCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] autorelease];
		cell.delegate = tableCellDelegate;
		[cell setViewModel:adiltcvm];
		
		[tableCells setObject:cell forKey:indexPath];
    }	
	
	// Only load cached images for each three images in the cell.
	int index = row * 3;
	if (!adiltcvm.adilvm1.thumb104)
	{
		[self startThumbDownload:adiltcvm.adilvm1 forIndex:[NSNumber numberWithInt:index]];            
	}
	if (!adiltcvm.adilvm2.thumb104)
	{
		[self startThumbDownload:adiltcvm.adilvm2 forIndex:[NSNumber numberWithInt:(index + 1)]];            
	}
	if (!adiltcvm.adilvm3.thumb104)
	{
		[self startThumbDownload:adiltcvm.adilvm3 forIndex:[NSNumber numberWithInt:(index + 2)]];            
	}
    
    return cell;
}

#pragma mark -
#pragma mark Table cell image support

- (void)thumbDidLoad:(NSNumber *)index
{
    ThumbDownloader *iconDownloader = [thumbDownloadsInProgress objectForKey:index];
    if (iconDownloader != nil)
    {
		int row = ([index intValue] / 3);
        AdilTableCell *cell = (AdilTableCell*)[self cellForRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:0]];
        
        // Tell the cell that it needs to redraw itself.
		[cell redrawImages];
		
		[thumbDownloadsInProgress removeObjectForKey:index];
    }
}

- (void)dealloc {
	[adilvms release];
	[adiltcvms release];
	[tableCells release];
	[thumbDownloadsInProgress release];
    [super dealloc];
}


@end
