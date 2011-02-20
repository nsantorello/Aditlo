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
	[TodayRequest requestWithDelegate:self];
	adilController.thumbDownloadsInProgress = [NSMutableDictionary dictionary];
}

- (void)viewDidLoad
{
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

- (IBAction)showRecordingView
{
	// Show adil recorder.
	AdilRecorderController *recorder = [[AdilRecorderController alloc] init];	
	recorder.delegate = self;
	recorder.videoQuality = UIImagePickerControllerQualityTypeLow;
	[self presentModalViewController:recorder animated:YES];
	[recorder release];
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

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info 
{
	NSURL* recordingURL = [info objectForKey:UIImagePickerControllerMediaURL];
	NSString* recordingPath = [recordingURL path];
	
	UISaveVideoAtPathToSavedPhotosAlbum(recordingPath, self, @selector(video:didFinishSavingWithError:contextInfo:), nil);
	NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"latest_adil.mov"];
	NSError *error = nil;
	[[NSFileManager defaultManager] copyItemAtPath:recordingPath toPath:filePath error:&error];
	if (error) {
		[[NSFileManager defaultManager] removeItemAtPath:filePath error:&error];
		[[NSFileManager defaultManager] copyItemAtPath:recordingPath toPath:filePath error:&error];
	}
	
	[CreateAdilRequest requestWithDelegate:nil andVideoURL:filePath];
}

- (void)dealloc 
{
	[gridTable release];
	[adilController release];
	[topNavBar release];
    [super dealloc];
}


@end
