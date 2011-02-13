//
//  GridTableCell.h
//  Aditlo
//
//  Created by Noah Santorello on 2/12/11.
//  Copyright 2011 Noah Santorello. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ABTableViewCell.h"

@interface GridTableCell : ABTableViewCell {
	UIImage* img1;
	UIImage* img2;
	UIImage* img3;
}

@property (nonatomic, retain) UIImage* img1;
@property (nonatomic, retain) UIImage* img2;
@property (nonatomic, retain) UIImage* img3;

@end
