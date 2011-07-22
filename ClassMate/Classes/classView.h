//
//  classView.h
//  ClassMate
//
//  Created by CS Admin on 7/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DescriptionView.h"

@interface classView : UITableViewController {
	NSArray *homework;
	NSArray *tests;
	NSArray *projects;
	DescriptionView *descriptionViewController;

}

@property (nonatomic, retain) DescriptionView *descriptionViewController;
@property (nonatomic, retain) NSArray *homework;
@property (nonatomic, retain) NSArray *tests;
@property (nonatomic, retain) NSArray *projects;

@end
