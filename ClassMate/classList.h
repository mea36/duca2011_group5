//
//  classList.h
//  ClassMate
//
//  Created by CS Admin on 7/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "classView.h"

@interface classList : UITableViewController {
	classView *classViewController;
	
}
@property(nonatomic, retain) classView *classViewController;


@end
