//
//  GridTableViewController.m
//  Aditlo
//
//  Created by Noah Santorello on 2/12/11.
//  Copyright 2011 Noah Santorello. All rights reserved.
//

#import "AdilTableViewController.h"


@implementation AdilTableViewController

@synthesize imageDownloadsInProgress;

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
	[self setAdilViewModels:adils];
	
	[self setAdilTableCellViewModels:adilvms];
	
	[self.tableView reloadData];
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
    
    static NSString *CellIdentifier = @"GridTableCell";
    
    GridTableCell *cell = (GridTableCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
		cell = [[[GridTableCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] autorelease];
    }    
	
	int row = indexPath.row;
	AdilTableCellViewModel* adiltcvm = [adiltcvms objectAtIndex:row];
	
	// Only load cached images for each three images in the cell.
	int index = row * 3;
	if (!adiltcvm.adilvm1.thumb104)
	{
		[self startIconDownload:adiltcvm.adilvm1 forIndex:[NSNumber numberWithInt:index]];            
	}
	if (!adiltcvm.adilvm2.thumb104)
	{
		[self startIconDownload:adiltcvm.adilvm2 forIndex:[NSNumber numberWithInt:(index + 1)]];            
	}
	if (!adiltcvm.adilvm3.thumb104)
	{
		[self startIconDownload:adiltcvm.adilvm3 forIndex:[NSNumber numberWithInt:(index + 2)]];            
	}
	
	[cell setViewModel:adiltcvm];
    
    return cell;
}

#pragma mark -
#pragma mark Table cell image support

- (void)startIconDownload:(AdilViewModel *)adilvm forIndex:(NSNumber *)index
{
    IconDownloader *iconDownloader = [imageDownloadsInProgress objectForKey:index];
    if (iconDownloader == nil) 
    {
        iconDownloader = [[IconDownloader alloc] init];
        iconDownloader.adilvm = adilvm;
        iconDownloader.index = index;
        iconDownloader.delegate = self;
        [imageDownloadsInProgress setObject:iconDownloader forKey:index];
        [iconDownloader startDownload];
        [iconDownloader release];   
    }
}

// called by our ImageDownloader when an icon is ready to be displayed
- (void)thumbDidLoad:(NSNumber *)index
{
    IconDownloader *iconDownloader = [imageDownloadsInProgress objectForKey:index];
    if (iconDownloader != nil)
    {
		int row = ([index intValue] / 3);
        GridTableCell *cell = (GridTableCell*)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:0]];
        
        // Tell the cell that it needs to redraw itself.
		[cell setNeedsDisplay];
    }
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
	// terminate all pending download connections
    NSArray *allDownloads = [self.imageDownloadsInProgress allValues];
    [allDownloads makeObjectsPerformSelector:@selector(cancelDownload)];
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
	[adilvms release];
	[adiltcvms release];
	[imageDownloadsInProgress release];
    [super dealloc];
}


@end

