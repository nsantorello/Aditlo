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
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [adiltcvms count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"GridTableCell";
    
    GridTableCell *cell = (GridTableCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
		cell = [[[GridTableCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] autorelease];
    }    
	
	AdilTableCellViewModel* adiltcvm = [adiltcvms objectAtIndex:indexPath.row];
	// Only load cached images.
	if (!adiltcvm.adilvm1.thumb104)
	{
		[self startIconDownload:adiltcvm.adilvm1 forIndexPath:indexPath];            
	}
	
	[cell setAdilTableCellViewModel:adiltcvm];
    
    return cell;
}

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
	
}

#pragma mark -
#pragma mark Table cell image support

- (void)startIconDownload:(AdilViewModel *)adilvm forIndexPath:(NSIndexPath *)indexPath
{
    IconDownloader *iconDownloader = [imageDownloadsInProgress objectForKey:indexPath];
    if (iconDownloader == nil) 
    {
        iconDownloader = [[IconDownloader alloc] init];
        iconDownloader.adilvm = adilvm;
        iconDownloader.indexPathInTableView = indexPath;
        iconDownloader.delegate = self;
        [imageDownloadsInProgress setObject:iconDownloader forKey:indexPath];
        [iconDownloader startDownload];
        [iconDownloader release];   
    }
}

// called by our ImageDownloader when an icon is ready to be displayed
- (void)thumbDidLoad:(NSIndexPath *)indexPath
{
    IconDownloader *iconDownloader = [imageDownloadsInProgress objectForKey:indexPath];
    if (iconDownloader != nil)
    {
        GridTableCell *cell = (GridTableCell*)[self.tableView cellForRowAtIndexPath:iconDownloader.indexPathInTableView];
        
        // Display the newly loaded image
		[cell setAdilTableCellViewModel:[cell getViewModel]];
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

