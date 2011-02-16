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

@protocol AdilTableCellDelegate;

@interface AdilTableCell : FastTableViewCell {
	AdilTableCellViewModel* adiltcvm; // The view model for this cell.
	id<AdilTableCellDelegate> delegate;
}

@property (nonatomic, assign) id<AdilTableCellDelegate> delegate;

- (void)setViewModel:(AdilTableCellViewModel*)vm;
- (AdilTableCellViewModel*)getViewModel;

@end

@protocol AdilTableCellDelegate

- (void)performedViewAction:(AdilViewModel*)adilViewModel;

@end

