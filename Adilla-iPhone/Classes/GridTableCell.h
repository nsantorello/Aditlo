//
//  GridTableCell.h
//  Aditlo
//
//  Created by Noah Santorello on 2/12/11.
//  Copyright 2011 Noah Santorello. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FastTableViewCell.h"
#import "AdilTableCellViewModel.h"

@interface GridTableCell : FastTableViewCell {
	AdilTableCellViewModel* adiltcvm;
}

- (void)setAdilTableCellViewModel:(AdilTableCellViewModel*)vm;

- (AdilTableCellViewModel*)getViewModel;

@end
