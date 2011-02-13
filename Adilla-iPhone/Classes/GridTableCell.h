//
//  GridTableCell.h
//  Aditlo
//
//  Created by Noah Santorello on 2/12/11.
//  Copyright 2011 Noah Santorello. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FastTableViewCell.h"

@interface GridTableCell : FastTableViewCell {
	UIImage* img1;
	UIImage* img2;
	UIImage* img3;
}

- (void)setImg1:(UIImage *)im1 andImg2:(UIImage*)im2 andImg3:(UIImage*)im3;

@end
