//
//  classList.h
//  ClassMate
//
//  Created by CS Admin on 7/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "classView.h"


@interface classList : UIViewController {
	classView *classViewController;
	NSArray *classes;
	int class_id;
}

@property(nonatomic, retain) classView *classViewController;
@property(nonatomic, retain) NSArray *classes;

@end
