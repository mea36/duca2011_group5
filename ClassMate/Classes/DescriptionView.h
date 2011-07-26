//
//  DescriptionView.h
//  ClassMate
//
//  Created by CS Admin on 7/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DescriptionView : UIViewController {
	NSString *eventDescription;
	NSDate *eventDueDate;
	IBOutlet UITextView *eventDesc;
	NSString *eventTitle;
}

@property (nonatomic,retain) NSString *eventDescription;
@property (nonatomic,retain) NSDate	*eventDueDate;
@property (nonatomic,retain) IBOutlet UITextView *eventDesc;
@property (nonatomic,retain) NSString *eventTitle;

@end
