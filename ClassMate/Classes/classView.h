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
	NSMutableArray *homework;
	NSMutableArray *tests;
	NSMutableArray *projects;
	DescriptionView *descriptionViewController;
	int classID;
	NSString *className;
}

@property (nonatomic, retain) DescriptionView *descriptionViewController;
@property (nonatomic, retain) NSArray *homework;
@property (nonatomic, retain) NSArray *tests;
@property (nonatomic, retain) NSArray *projects;

@property (nonatomic, retain) NSString *className;
@property (nonatomic, assign) int classID;


@end
