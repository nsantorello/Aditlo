//
//  AdilViewModel.h
//  Aditlo
//
//  Created by Noah Santorello on 2/13/11.
//  Copyright 2011 Noah Santorello. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Adil.h"

@interface AdilViewModel : NSObject {
	Adil* adil;
	UIImage* thumb104;
	UIImage* thumb208;
}

@property (nonatomic, retain) Adil* adil;
@property (nonatomic, retain) UIImage* thumb104;
@property (nonatomic, retain) UIImage* thumb208;

- (id)initWithAdil:(Adil*)ad;

@end
