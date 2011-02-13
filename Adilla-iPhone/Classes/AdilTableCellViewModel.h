//
//  AdilTableCellViewModel.h
//  Aditlo
//
//  Created by Noah Santorello on 2/13/11.
//  Copyright 2011 Noah Santorello. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AdilViewModel.h"

@interface AdilTableCellViewModel : NSObject {
	AdilViewModel* adilvm1;
	AdilViewModel* adilvm2;
	AdilViewModel* adilvm3;
}

@property (nonatomic, retain) AdilViewModel* adilvm1;
@property (nonatomic, retain) AdilViewModel* adilvm2;
@property (nonatomic, retain) AdilViewModel* adilvm3;

- (id)initWithAdil1:(AdilViewModel*)a1 andAdil2:(AdilViewModel*)a2 andAdil3:(AdilViewModel*)a3;

@end
