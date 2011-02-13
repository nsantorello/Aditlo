//
//  MainViewController.h
//  Aditlo
//
//  Created by Noah Santorello on 2/12/11.
//  Copyright 2011 Noah Santorello. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GridTable.h"
#import "GridTableViewController.h"

@interface MainViewController : UIViewController {
	IBOutlet GridTable* gridTable;
	IBOutlet GridTableViewController* gtvController;
	
	IBOutlet UINavigationBar* topNavBar;
}

@end
