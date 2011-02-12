//
//  GridTableViewController.h
//  Aditlo
//
//  Created by Noah Santorello on 2/12/11.
//  Copyright 2011 Noah Santorello. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GridTableCell.h"

@interface GridTableViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource> {
	IBOutlet GridTableCell* gridCell;
}

@end
