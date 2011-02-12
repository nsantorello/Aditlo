//
//  GridTableCell.h
//  Aditlo
//
//  Created by Noah Santorello on 2/12/11.
//  Copyright 2011 Infusion Development. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface GridTableCell : UITableViewCell {
	UIImageView* img1;
	UIImageView* img2;
	UIImageView* img3;
}

@property (nonatomic, retain) IBOutlet UIImageView* img1;
@property (nonatomic, retain) IBOutlet UIImageView* img2;
@property (nonatomic, retain) IBOutlet UIImageView* img3;

@end
